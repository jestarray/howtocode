;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 11.04-apply-transaction_solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define PNAME 'apply-transaction)

#|
CHEATSHEET: https://docs.racket-lang.org/htdp-langs/beginner.html
TEMPLATES: https://howtocode.pages.dev/htdp_templates
ASK FOR HELP: https://discord.com/invite/6Zq8sH5
Turn all ❌ into ✅ for each step you complete
== Data ==
    1. Data Description✅
        1B. if using define-struct, write all accessor signatures✅
    2. Interpretation✅
    3. Data Examples❌
    4. A function template that processes this data❌
== Functions ==
    1. Signature, purpose, stub ❌
    2. Examples (aka check-expect/tests, elaborate the concrete) ❌
    3. Template(from data)?❌
    4. Code body ❌
    5. Test, review, and refactor(review all steps, ctrl+i to auto-format) ❌
|#

#|PROBLEM A:
Notice the Data Definitions for Account, Deposit, Withdraw, and Transfer are done.
Finish the uncompleted steps ❌ of Data Design above for "Transaction"(examples and template)
|#

(define-struct account [name amount])
; Account is (make-balance String Number)
; interp.
; name is the owner of the bank account
; amount is the current balance of a bank account

; account-name : (Account -> String)
; account-amount : (Account -> Number)

; Account-temp : (Account -> ???)
(define (account-temp acc)
  (...
   (account-name acc)
   (account-amount acc)))

(define-struct deposit [amount])
; Deposit is (make-deposit Number)
; interp.
; represents putting money into a bank account

; deposit-amount : (Deposit -> Number)

; deposit-temp : (Deposit -> ???)
(define (deposit-temp dps)
  (... (deposit-amount dps)))

(define-struct withdraw [amount])
; Withdraw is (make-withdraw Number)
; interp.
; represents taking money out of a bank account

; withdraw-amount : (Withdraw -> Number)

; withdraw-temp : (Withdraw -> ???)
(define (withdraw-temp wth)
  (... (withdraw-amount wth)))

(define-struct transfer [from to amount])
; Transfer is (make-transfer Account Account Number)
; interp.
; from is the Account we want to take money from
; to is the Account we want to give money to
; amount is the amount of money

; transfer-from : (Transfer -> Account)
; transfer-to : (Transfer -> Account)
; transfer-amount : (Transfer -> Account)

; transfer-temp : (Transfer -> ???)
(define (transfer-temp tfr)
  (... (account-temp (transfer-from tfr))
       (account-temp (transfer-to tfr))
       (transfer-amount tfr)))

; union Transaction is one of:
; - (make-deposit Number)
; - (make-withdraw Number)
; - (make-transfer Account Account Number)
; interp. a set of bank account transactions

; TODO: 3. Examples and 4.Template

#|PROBLEM B:
Design a function "apply-transaction" that consumes an Account and a Transaction 
; and produces the balance(amount) of the given Account after the transaction has been applied.

For example:
| my-account | action                             | result|
| $100       | (make-withdraw 10)                 | $90   |
| $90        | (make-deposit 30)                  | $120  |
| $50        | (make-transfer my-account joes 20) | $30   |
| $10        | (make-transfer joes my-account 30) | $40   |
|#

; apply-transaction : (Account Transaction -> Number)
; apply the given transaction based on the table above to the given Account