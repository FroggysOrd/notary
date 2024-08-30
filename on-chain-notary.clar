// Contract Name: on-chain-notary

(define-data-var contract-id uint 0)
(define-data-var contracts (map uint {creator: principal, text: (string-ascii 1000), signers: (map principal bool)}) {})
(define-data-var verified-wallets (map principal bool) {})

;; This function allows a verified user to create a new contract.
;; The user inputs the contract text, and it gets stored on the blockchain.
(define-public (create-contract (contract-text (string-ascii 1000)))
  (begin
    ;; Ensure that only verified users can create a contract
    (if (map-get? verified-wallets (tx-sender))
      (let ((new-contract-id (+ (var-get contract-id) u1)))
        (begin
          ;; Store the new contract in the contract map with an empty signer map
          (map-set contracts new-contract-id
            {creator: tx-sender, text: contract-text, signers: {}})
          ;; Increment the contract ID for the next contract
          (var-set contract-id new-contract-id)
          ;; Return the ID of the new contract
          (ok new-contract-id)
        )
      )
      ;; Return an error if the user is not verified
      (err u100)
    )
  )
)

;; This function allows a verified user to sign an existing contract.
;; The user must provide the contract ID they want to sign.
(define-public (sign-contract (contract-id uint))
  (begin
    ;; Ensure that only verified users can sign contracts
    (if (map-get? verified-wallets (tx-sender))
      (let ((contract (map-get contracts contract-id)))
        (if (is-some contract)
          (let ((signer-map (unwrap-panic (get signers (unwrap-panic contract)))))
            ;; Add the sender to the signer's map with a value of 'true' indicating they have signed
            (map-set contracts contract-id
              (merge contract
                {signers: (map-insert tx-sender true signer-map)}))
            (ok true)
          )
          ;; Return an error if the contract does not exist
          (err u404)
        )
      )
      ;; Return an error if the user is not verified
      (err u100)
    )
  )
)

;; This function checks if a particular user has signed a contract.
;; The function takes a contract ID and a user's principal as input.
(define-read-only (has-signed (contract-id uint) (user principal))
  (let ((contract (map-get contracts contract-id)))
    (if (is-some contract)
      ;; Return true if the user is in the signers' map, otherwise false
      (ok (is-eq (map-get? (get signers (unwrap-panic contract)) user) true))
      ;; Return false if the contract does not exist
      (err u404)
    )
  )
)

;; This function adds a wallet to the list of verified wallets.
;; This function should only be callable by the admin (not implemented in this draft).
(define-public (verify-wallet (wallet principal))
  (begin
    ;; Add the wallet to the verified wallets map with a value of 'true'
    (map-set verified-wallets wallet true)
    (ok true)
  )
)

;; This function allows checking if a wallet is verified.
(define-read-only (is-verified (wallet principal))
  (ok (map-get? verified-wallets wallet))
)

;; This function allows the creator of a contract to get the list of signers.
;; It returns the signers' map associated with the contract.
(define-read-only (get-signers (contract-id uint))
  (let ((contract (map-get contracts contract-id)))
    (if (is-some contract)
      (ok (get signers (unwrap-panic contract)))
      ;; Return an error if the contract does not exist
      (err u404)
    )
  )
)
