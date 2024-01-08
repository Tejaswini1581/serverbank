package BankingSystem.BankClient.models.pojo;

import java.sql.Timestamp;

import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;

public class Transfer {
    private String transferId;
    private Account sourceAccount;
    private String destinationAccountName;
	@DecimalMin(value = "1", inclusive = true, message = "Please enter an amount between 1 and 99,999")
    @DecimalMax(value = "99999", inclusive = true, message = "Please enter an amount between 1 and 99,999")
    private Double amount;
    private Timestamp timeStamp;
    private String remarks;
    private String transferType;
    public Transfer() {
        super();
    }

    public Transfer(String transferId, Account sourceAccount, String destinationAccountName, Double amount,
            Timestamp timeStamp, String remarks, String transferType) {
        super();
        this.transferId = transferId;
        this.sourceAccount = sourceAccount;
        this.destinationAccountName = destinationAccountName;
        this.amount = amount;
        this.timeStamp = timeStamp;
        this.remarks = remarks;
        this.transferType = transferType;
    }
    public String getTransferId() {
        return transferId;
    }

    public void setTransferId(String transferId) {
        this.transferId = transferId;
    }
    public Account getSourceAccount() {
        return sourceAccount;
    }

    public void setSourceAccount(Account sourceAccount) {
        this.sourceAccount = sourceAccount;
    }
    public String getDestinationAccountName() {
        return destinationAccountName;
    }

    public void setDestinationAccountName(String destinationAccountName) {
        this.destinationAccountName = destinationAccountName;
    }
    public Double getAmount() {
        return amount;
    }
    public void setAmount(Double amount) {
        this.amount = amount;
    }
    public Timestamp getTimeStamp() {
        return timeStamp;
    }
    public void setTimeStamp(Timestamp timeStamp) {
        this.timeStamp = timeStamp;
    }
    public String getRemarks() {
        return remarks;
    }
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }
    public String getTransferType() {
        return transferType;
    }
    public void setTransferType(String transferType) {
        this.transferType = transferType;
    }

}