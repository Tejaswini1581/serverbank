package BankingSystem.BankClient.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientResponseException;
import org.springframework.web.client.RestTemplate;

import BankingSystem.BankClient.models.pojo.Customer;
import BankingSystem.BankClient.models.pojo.Transactions;
import BankingSystem.BankClient.models.pojo.Transfer;
import BankingSystem.BankClient.models.pojo.Account;
import BankingSystem.BankClient.models.pojo.Admin;
import BankingSystem.BankClient.models.restconnect.resturls;
import jakarta.validation.Valid;

@SessionAttributes({"user","adminID"})
@Controller
public class ClientController {

	@Autowired
	RestTemplate restTemplate;
	

	@RequestMapping("/balance")
	public String balance(Model M) {
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		M.addAttribute("b",cus.getAccountNo().getBalance());
		return "balance";
	}
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	@RequestMapping("/aboutus")
	public String aboutus()
	{
		return "aboutus";
	}
	@RequestMapping("/services")
	public String services()
	{
		return "services";
	}
	@RequestMapping("/deposit")
	public String deposit(Model M)
	{
		Transactions t=new Transactions();
		M.addAttribute("C",t);
		return "deposit";
	}
	@RequestMapping("/deposit1")
	public String withdraw12(@Valid @ModelAttribute("C") Transactions C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				C.setTransactionType("deposit");
				C.setAccountNo(cus.getAccountNo());
//				C.setTransactionId(null);
//				C.setTimestamp(null);
				Double b=cus.getAccountNo().getBalance()+C.getAmount();
				cus.getAccountNo().setBalance(b);
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getAccountNo().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Deposited successfully.Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSACTIONS, C, String.class);
				return "deposit";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "deposit";
			}
		}
		return "deposit";
	}
	@RequestMapping("/withdraw")
	public String withdraw(Model M)
	{
		Transactions t=new Transactions();
		M.addAttribute("C",t);
		return "withdraw";
	}
	@RequestMapping("/withdraw1")
	public String withdraw1(@Valid @ModelAttribute("C") Transactions C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("msg", "insufficient balance. Your balance is "+cus.getAccountNo().getBalance());
					return "withdraw";
				}
				C.setTransactionType("withdraw");
				C.setAccountNo(cus.getAccountNo());
//				C.setTransactionId(null);
//				C.setTimestamp(null);
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getAccountNo().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Credited successfully.Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSACTIONS, C, String.class);
				return "withdraw";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "withdraw";
			}
		}
		return "withdraw";
	}	
	

	@RequestMapping("/transfer")
	public String transfer(Model M)
	{
		M.addAttribute("C",new Transfer());
		return "transfer";
	}
	@RequestMapping("/transfer1")
	public String transfer1(@Valid @ModelAttribute("C") Transfer C, BindingResult result, Model M,@ModelAttribute("account_ID") String idd) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("msg", "insufficient balance. Your balance is "+cus.getAccountNo().getBalance());
					return "transfer";
				}
				C.setTransferType("SameBank");
				C.setSourceAccount(cus.getAccountNo());
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getSourceAccount().getAccountNo()));
				Account l = restTemplate.getForEntity(resturls.GET_ACCOUNTS_BY_ID, Account.class,
						Map.of("id", idd)).getBody();
				String ss=l.getAccountNo();
				l.setBalance(l.getBalance()+C.getAmount());
				HttpEntity<Account> acc = new HttpEntity<>(l);/////
				ResponseEntity<String> Sc = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, acc,
						String.class, Map.of("id", ss));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Transfered successfully to "+C.getDestinationAccountName()+". Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSFERS, C, String.class);
				return "transfer";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "transfer";
			}
		}
		return "transfer";
	}	
	

	@RequestMapping("/transfer2")
	public String transfer2(@Valid @ModelAttribute("C") Transfer C, BindingResult result, Model M,@ModelAttribute("account_ID") String idd) {
		ResponseEntity<String> msg = null;
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		if (!result.hasErrors()) {
			try {
                M.addAttribute("C", C);
				if(cus.getAccountNo().getBalance()<C.getAmount())
				{
					M.addAttribute("msg", "insufficient balance. Your balance is "+cus.getAccountNo().getBalance());
					return "transfer";
				}
				C.setTransferType("OtherBank");
				C.setSourceAccount(cus.getAccountNo());
				Double b=cus.getAccountNo().getBalance()-C.getAmount();
				cus.getAccountNo().setBalance(b);
				HttpEntity<Account> account = new HttpEntity<>(cus.getAccountNo());
				ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_ACCOUNTS_BY_ID, HttpMethod.PUT, account,
						String.class, Map.of("id", C.getSourceAccount().getAccountNo()));
				M.addAttribute("msg", "Rs."+C.getAmount()+" Transfered successfully to "+C.getDestinationAccountName()+". Your current Balance is: "+b);
				msg = restTemplate.postForEntity(resturls.SAVE_TRANSFERS, C, String.class);
				return "transfer";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "transfer";
			}
		}
		return "transfer";
	}	

	@RequestMapping("/transactionDetails")
	public String transactionDetails(Model M)
	{
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		ResponseEntity<Transactions[]> varray = restTemplate.getForEntity(resturls.GET_TRANSACTIONS_BY_ACCOUNTID, Transactions[].class,
				Map.of("id", cus.getAccountNo().getAccountNo()));
		System.out.println("-----------");//not done
		Transactions list[] = varray.getBody();
		M.addAttribute("list", list);
		return "transactionDetails";
	}
	@RequestMapping("/transferDetails")
	public String transferDetails(Model M)
	{
		Customer cus=(Customer) M.getAttribute("user");
		if(cus==null)
			return "home";
		ResponseEntity<Transfer[]> varray = restTemplate.getForEntity(resturls.GET_TRANSFERS_BY_ACCOUNTID, Transfer[].class,
				Map.of("id", cus.getAccountNo().getAccountNo()));
		Transfer list[] = varray.getBody();
		M.addAttribute("list", list);
		return "transferDetails";
	}

	
	@RequestMapping("/loginAdmin")
	public String loginAdmin()
	{
		return "loginAdmin";
	}
//	 @RequestMapping("/checkLogin")
//	    public ResponseEntity<Boolean> checkLogin(Model model) {
//	        // Check if "user" or "adminID" attributes are present in the session
//	        if (model.containsAttribute("user") || model.containsAttribute("adminID")) {
//	            return ResponseEntity.ok(true);
//	        } else {
//	            return ResponseEntity.ok(false);
//	        }
//	    }
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus)
	{
		sessionStatus.setComplete();
		return "home";
	}
	
	

	@RequestMapping("/insertCustomer")
	public String insertCustomer(Model M) {
		Customer c=new Customer();
		c.setAccountNo(null);
		c.setStatus("Pending");
		M.addAttribute("C", c);
		return "insertCustomer";
	}

	@RequestMapping("/insertCustomer1")
	public String insertCustomer(@Valid @ModelAttribute("C") Customer C, BindingResult result, Model M) {
		ResponseEntity<String> msg = null;
		if (!result.hasErrors()) {
			try {
				msg = restTemplate.postForEntity(resturls.SAVE_CUSTOMERS, C, String.class);
                M.addAttribute("C", C);
				M.addAttribute("msg", msg.getBody());
				return "home";
			} catch (HttpClientErrorException E) {
                M.addAttribute("C", C);
				M.addAttribute("msg", E.getResponseBodyAsString());
				return "insertCustomer";
			}
		}
		return "insertCustomer";
	}

	@RequestMapping("/loginAdmin1")
	public String loginAdmin1(@RequestParam("adminId") String adminId,@RequestParam("password") String password,Model M)
	{
		try {
			ResponseEntity<Admin> l = restTemplate.getForEntity(resturls.GET_ADMINS_BY_ID, Admin.class,
					Map.of("id", adminId));
			Admin C = l.getBody();
			if(password.equals(C.getPassword()))
			{
				M.addAttribute("msg", "Welcome "+C.getAdminName());
				M.addAttribute("adminID", adminId);
				ResponseEntity<Customer[]> varray = restTemplate.getForEntity(resturls.GET_PENDING_CUSTOMERS, Customer[].class);
				Customer list[] = varray.getBody();
				M.addAttribute("list", list);
				return "Admin";
			}
			else
			{
				M.addAttribute("msg", "Incorrect Password");
			}
		} catch (Exception e) {
			M.addAttribute("msg", "AdminId doesnot exist");
		}
		return "loginAdmin";
	}
//
//	@RequestMapping("/Admin")
//	public String Admin_get(Model M) {
//		ResponseEntity<Customer[]> varray = restTemplate.getForEntity(resturls.GET_PENDING_CUSTOMERS, Customer[].class);
//		Customer list[] = varray.getBody();
//		M.addAttribute("list", list);
//		return "Admin";
//	}

	@RequestMapping("/loginCustomer")
	public String login()
	{
		return "loginCustomer";
	}
	@RequestMapping("/mainpage")
	public String mainpage()
	{
		return "main";
	}
	
	@RequestMapping("/main")
	public String home(@RequestParam("userId") String userId,@RequestParam("password") String password,Model M)
	{
		try {
			ResponseEntity<Customer> l = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer C = l.getBody();
			if(password.equals(C.getPassword()))
			{
				M.addAttribute("msg", "Welcome "+C.getFirstName());
				M.addAttribute("user", C);
				return "main";
			}
			else
			{
				M.addAttribute("msg", "Incorrect Password");
			}
		} catch (Exception e) {
			M.addAttribute("msg", "UserId doesnot exist");
		}
		return "loginCustomer";
	}
	@RequestMapping("/details")
	public String Customer_AccountDetails(Model M) {	
		try {
			Customer cus=(Customer) M.getAttribute("user");
			Account C = cus.getAccountNo();
			M.addAttribute("A", C);	
			System.out.println(C.getBalance());
		} catch (Exception e) {
			M.addAttribute("A", new Account());	
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "getAccountById";
	}
	
	
	
	@RequestMapping("/getCustomer")
	public String Customer_getAll(Model M) {
		M.addAttribute("A", new Customer());
		return "insertCustomer";
	}
	@RequestMapping("/getCustomer1")
	public String Customer_get(Model M) {
		ResponseEntity<Customer[]> varray = restTemplate.getForEntity(resturls.GET_ALL_CUSTOMERS, Customer[].class);
		Customer list[] = varray.getBody();
		M.addAttribute("list", list);
		return "getallCustomer";
	}

	@RequestMapping("/getCustomerById")
	public String Customer_getById() {
		return "getCustomerById";
	}

	@RequestMapping("/getCustomerById1")
	public String getAll(@RequestParam("userId") String userId, Model M) {
		try {
			ResponseEntity<Customer> l = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer customer = l.getBody();
			M.addAttribute("Customer", customer);
		} catch (Exception e) {
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "getCustomerById";
	}

	@RequestMapping("/updateCustomer1")
	public String updateCustomer(Model M) {
		M.addAttribute("A", new Customer());
		return "updateByCustomerId";
	}

	@RequestMapping("/getToUpdate/{id}")
	public String updateCustomer(@PathVariable("id") String userId, Model M) {
		try {
			ResponseEntity<Customer> v = restTemplate.getForEntity(resturls.GET_CUSTOMERS_BY_ID, Customer.class,
					Map.of("id", userId));
			Customer Customer = v.getBody();
			System.out.println(Customer.getUserId());
			M.addAttribute("Customer", Customer);
		} catch (Exception e) {
			M.addAttribute("Customer", new Customer());
			M.addAttribute("msg", ((RestClientResponseException) e).getResponseBodyAsString());
		}
		return "updateById";
	}

	@RequestMapping("/updateCustomer")
	public String updateCustomer(@Valid @ModelAttribute("Customer") Customer V, BindingResult result, Model M) {
//		restTemplate.put(resturls.UPDATE_CustomerS_BY_ID, V, Map.of("id", V.getRegistrationNo()));
		if (!result.hasErrors()) {
			HttpEntity<Customer> Customer = new HttpEntity<>(V);
			ResponseEntity<String> S = restTemplate.exchange(resturls.UPDATE_CUSTOMERS_BY_ID, HttpMethod.PUT, Customer,
					String.class, Map.of("id", V.getUserId()));
			M.addAttribute("msg", S.getBody());
		}
		return "updateById";
	}
//	  @InitBinder
//    public void initBinder(WebDataBinder binder) 
//    {
//		  binder.setRequiredFields(null);
////        binder.registerCustomEditor(Date.class,"hiredate",new CustomDateEditor(F, false));
//    }
//	  
	  
	
//
//		    @InitBinder
//		    public void initBinder(WebDataBinder binder) {
//		        // Create an instance of your custom data binder (hypothetical "binder" class)
//		        CustomDataBinder customBinder = new CustomDataBinder();
//
//		        // Set the required fields using the custom binder's setRequiredFields() method
//		        customBinder.setRequiredFields("username", "email", "password");
//
//		        // Register the custom binder for the specific form data class
//		        binder.registerCustomEditor(FormData.class, customBinder);
//		    }
//	
		
}