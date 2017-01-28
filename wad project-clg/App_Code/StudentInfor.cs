using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for StudentInfor
/// </summary>
public class StudentInfor
{
    String userName;
    String password;
    bool certifiedchecked;
    String socialSecurityNumber;
    String fullName;
    String dateOfBirth;
    String address;
    String emailAddress;
    String securityQuestion;
    String securityQuestionAnswer;
    int accountNumber;
    String lastUpdatedDate;
    float currentBalance;
    float regularMonthlyPaymentAmount;
    float amountSatisfiedByExtraPayment;
    float pastDueAmount;
    float currentAmountDue;
    String currentStatementDueDate;
    public StudentInfor(String full, String social, String date, String add, String use, String pass, String email, String security, String securityAnswer, int account, bool certified, String lud, float cB, float rMPA, float aSBEP, float pDA, float cAD, String cSDD)
    {
        UserName = use;
        Password = pass;
        Certifiedchecked = certified;
        socialSecurityNumber = social;
        FullName = full;
        DateOfBirth = date;
        Address = add;
        EmailAddress = email;
        SecurityQuestion = security;
        SecurityQuestionAnswer = securityAnswer;
        AccountNumber = account;
        LastUpdatedDate = lud;
        CurrentBalance = cB;
        RegularMonthlyPaymentAmount = rMPA;
        AmountSatisfiedByExtraPayment = aSBEP;
        PastDueAmount = pDA;
        CurrentAmountDue = cAD;
        CurrentStatementDueDate = cSDD;
            // TODO: Add constructor logic here
        //
    }
        public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }
    public string Password
    {
        get { return password; }
        set { password = value; }
    }
    public bool Certifiedchecked
    {
        get { return certifiedchecked; }
        set { certifiedchecked = value; }
    }
    public string SocialSecurityNumber
    {
        get { return socialSecurityNumber; }
        set { socialSecurityNumber = value; }
    }
    public string FullName
    {
        get { return fullName; }
        set { fullName = value; }
    }
    public string DateOfBirth
    {
        get { return dateOfBirth; }
        set { dateOfBirth = value; }
    }
    public string Address
    {
        get { return address; }
        set { address = value; }
    }
    public string EmailAddress
    {
        get { return emailAddress; }
        set { emailAddress = value; }
    }
    public string SecurityQuestion
    {
        get { return securityQuestion; }
        set { securityQuestion = value; }
    }
    public string SecurityQuestionAnswer
    {
        get { return securityQuestionAnswer; }
        set { securityQuestionAnswer = value; }
    }
    public int AccountNumber
    {
        get { return accountNumber; }
        set { accountNumber = value; }
    }
    public string LastUpdatedDate
    {
        get { return lastUpdatedDate; }
        set { lastUpdatedDate = value; }
    }
    public float CurrentBalance
    {
        get { return currentBalance; }
        set { currentBalance = value; }
    }
    public float RegularMonthlyPaymentAmount
    {
        get { return regularMonthlyPaymentAmount; }
        set { regularMonthlyPaymentAmount = value; }
    }
    public float AmountSatisfiedByExtraPayment
    {
        get { return amountSatisfiedByExtraPayment; }
        set { amountSatisfiedByExtraPayment = value; }
    }
    public float PastDueAmount
    {
        get { return pastDueAmount; }
        set { pastDueAmount = value; }
    }
    public float CurrentAmountDue
    {
        get { return currentAmountDue; }
        set { currentAmountDue = value; }
    }
    public string CurrentStatementDueDate
    {
        get { return currentStatementDueDate; }
        set { currentStatementDueDate = value; }
    }
}
