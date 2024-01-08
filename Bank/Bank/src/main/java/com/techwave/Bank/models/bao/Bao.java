package com.techwave.Bank.models.bao;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.techwave.Bank.models.dao.service.IAccount;
import com.techwave.Bank.models.dao.service.IActivity;
import com.techwave.Bank.models.dao.service.IAdmin;
import com.techwave.Bank.models.dao.service.ICustomer;
import com.techwave.Bank.models.dao.service.IProduceID;
import com.techwave.Bank.models.dao.service.IReceiverAccount;
import com.techwave.Bank.models.dao.service.ITransaction;
import com.techwave.Bank.models.dao.service.ITransfer;
import com.techwave.Bank.models.pojo.Account;
import com.techwave.Bank.models.pojo.Activity;
import com.techwave.Bank.models.pojo.Admin;
import com.techwave.Bank.models.pojo.Customer;
import com.techwave.Bank.models.pojo.ReceiverAccount;
import com.techwave.Bank.models.pojo.Transactions;
import com.techwave.Bank.models.pojo.Transfer;

public class Bao {

    @Autowired
    IAccount accountDao;
    @Autowired
    IActivity activityDao;
    @Autowired
    IAdmin adminDao;
    @Autowired
    ICustomer customerDao;
    @Autowired
    IReceiverAccount receiverAccountDao;
    @Autowired
    ITransaction transactionsDao;
    @Autowired
    ITransfer transferDao;
    @Autowired
    IProduceID produceIDDao;


	public Customer getByPhoneNo(String id) {
		// TODO Auto-generated method stub
		return customerDao.getByPhoneNo(id);
	}
	public Customer getByMailId(String mailId) {
		return customerDao.getByMailId(mailId);
	}
    public List<Activity> Activity_getAll()
    {
    	return activityDao.getAll();
    }
    public Activity Activity_getByActivityId(String activity)
    {
    	return activityDao.getByActivityId(activity);
    }
    public List<Activity> Activity_getByUserId(String activity)
    {
    	return activityDao.findByUserId(activity);
    }
    public String Activity_insert(Activity a)
    {
		String i=produceIDDao.getNextActivityId();
    	a.setSessionId(i);
    	activityDao.insert(a);
    	return i;
    }
	public String Activity_update(Activity v, String id) {
    	return activityDao.update(v, id);
	}
	
	public ReceiverAccount findByAccountHolderName(String accountHolderName, String bank) {

        return receiverAccountDao.findByAccountHolderName(accountHolderName,bank);

    }
	public List<ReceiverAccount> ReceiverAccount_getAll(String name) {
		return receiverAccountDao.getAll(name);
	}
	public List<Account> Account_getByDestinationAccountName(String id) {
    	return accountDao.getByAccountName(id);
	}
    public List<Account> Account_getAll()
    {
    	return accountDao.getAll();
    }
    public Account Account_getByAccountId(String accountId)
    {
    	return accountDao.getByAccountId(accountId);
    }
    public String Account_insert(Account a)
    {
    	return accountDao.insert(a);
    }
    public String Account_update(Account a , String  accountId)
    {
    	return accountDao.update(a,accountId);
    }
    public String Account_Delete( String  accountId)
    {
    	return accountDao.Delete(accountId);
    }
	

    public List<Admin> Admin_getAll()
    {
    	return adminDao.getAll();
    }
    public Admin Admin_getByAdminId(String adminId)
    {
    	return adminDao.getByAdminId(adminId);
    }
    public String Admin_insert(Admin a)
    {
    	return adminDao.insert(a);
    }
    public String Admin_update(Admin a, String  adminId)
    {
    	return adminDao.update(a,adminId);
    }
    public String Admin_Delete( String  adminId)
    {
    	return adminDao.Delete(adminId);
    }
    

    public List<Customer> Customer_getAll()
    {
    	return customerDao.getAll();
    }
    public Customer Customer_getByCustomerId(String customerId)
    {
    	return customerDao.getByCustomerId(customerId);
    }
    public String Customer_insert(Customer a)
    {
		String i=produceIDDao.getNextCustomerId();
		a.setUserId(i);
		customerDao.insert(a);
    	return i;
    }

	public List<Customer> getPendingCustomers() {
		return customerDao.getPendingCustomers();
		
	}
	public String updateStatus(String C, Customer customer) {
		if(C.equals("Accepted"))
		{
	    	Account a=new Account();
	    	a.setAccountNo(produceIDDao.getNextAccountId());
	    	a.setAccountName(customer.getFirstName().toUpperCase()+customer.getLastName().toUpperCase());
	    	a.setBalance(0.0);
	    	accountDao.insert(a);
	    	customer.setAccountNo(a);
		}
        return customerDao.updateStatus(C, customer);
	}
    public String Customer_update(Customer C, String customerId)
    {
    	return customerDao.update(C,customerId);
    }
    public String Customer_Delete(String customerId)
    {
    	return customerDao.Delete(customerId);
    }
	

    public List<ReceiverAccount> ReceiverAccount_getAll()
    {
    	return receiverAccountDao.getAll();
    }
    public ReceiverAccount ReceiverAccount_getByReceiverAccountId(String receiverAccountId)
    {
    	return receiverAccountDao.getByReceiverAccountId(receiverAccountId);
    }
    public String ReceiverAccount_insert(ReceiverAccount r)
    {
    	return receiverAccountDao.insert(r);
    }
    public String ReceiverAccount_update(ReceiverAccount v , String receiverAccountId)
    {
    	return receiverAccountDao.update(v,receiverAccountId);
    }
    public String ReceiverAccount_Delete( String receiverAccountId)
    {
    	return receiverAccountDao.Delete(receiverAccountId);
    }
	public List<String> findAccountHolderNamesByPartialName(String partialName) {
		return receiverAccountDao.findAccountHolderNamesByPartialName(partialName);
	}
	

	public List<Transactions> findByAccountNo(Account accountNo) {
		System.out.println("BAO 1-------------");
		return transactionsDao.findByAccountNo(accountNo);
	}
	public List<Transactions> Transactions_getAll()
    {
    	return transactionsDao.getAll();
    }
	public Transactions Transactions_getByTransactionsId(String transactionsId)
    {
    	return transactionsDao.getByTransactionsId(transactionsId);
    }
	public String Transactions_insert(Transactions a)
    {
		Timestamp instant= Timestamp.from(Instant.now()); 
    	a.setTransactionId(produceIDDao.getNextTransactionId());
    	a.setTimestamp(instant);
    	return transactionsDao.insert(a);
    }
	public String Transactions_update(Transactions t , String transactionsId)
    {
    	return transactionsDao.update(t,transactionsId);
    }
	public String Transactions_Delete( String transactionsId)
    {
    	return transactionsDao.Delete(transactionsId);
    }
	

	public List<Transfer> findTransferByAccountNo(Account accountNo) {
		return transferDao.findByAccountNo(accountNo);
	}
	public List<Transfer> Transfer_getAll()
    {
    	return transferDao.getAll();
    }
	public Transfer Transfer_getByTransferId(String transferId)
    {
    	return transferDao.getByTransferId(transferId);
    }
	public String Transfer_insert(Transfer a)
    {
		Timestamp instant= Timestamp.from(Instant.now()); 
		String i=produceIDDao.getNextTransferId();
    	a.setTransferId(i);
    	a.setTimeStamp(instant);
    	return transferDao.insert(a);
    }
	public String Transfer_insert_both(Transfer a,Account did,Double bal)
    {
		Transactions t=new Transactions();
		Timestamp instant= Timestamp.from(Instant.now()); 
		String i=produceIDDao.getNextTransferId();
    	a.setTransferId(i);
    	a.setTimeStamp(instant);
    	t.setAccountNo(did);
    	t.setTransactionId(i);
    	t.setTimestamp(instant);
    	t.setAmount(a.getAmount());
    	t.setTransactionType("Transfer from "+a.getSourceAccount().getAccountName()+"/"+a.getSourceAccount().getAccountNo());
    	t.setRemarks(bal.toString());
    	try {
    		transactionsDao.insert(t);
    	}
    	catch(Exception e)
    	{
    		return "transaction not inserting";
    	}
    	return transferDao.insert(a);
    }
	public String Transfer_update(Transfer a , String  transferId)
    {
    	return transferDao.update(a,transferId);
    }
	public String Transfer_Delete( String  transferId)
    {
    	return transferDao.Delete(transferId);
    }
	
	
}
