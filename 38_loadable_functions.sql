--  2025 02 11 -- 06:07

-- 7.7. MySQL Server Loadable Functions
-- https://dev.mysql.com/doc/refman/8.4/en/server-loadable-functions.html

-- MySQL Supports loadable functions, that is, functions that are not built in
-- but can be loaded at runtime (either during startup or later) to extend server capabilities,
-- or unloaded to remove capabilities.
-- For a table describing the available loadable functions, see Section 14.2, "Loadable Function Reference". -- https://dev.mysql.com/doc/refman/8.4/en/loadable-function-reference.html

-- Loadable functions contrast with built-in (native) functions,
-- whic hare implemented as part of the server and a always available;
-- for a table, see Section 14.1, "Built-In Function and Operator Reference". -- https://dev.mysql.com/doc/refman/8.4/en/built-in-function-reference.html

-- MySQL distributions include loadable functions that implement, in whole or in part, these server capabilities:
-- * Group Replication
-- * Encryption operations
-- * Masking and de-identification
-- * Audit logging for monitoring and logging of connection and query activity
-- * Application-level firewall
-- * A query rewriter
-- * Version tokens
-- * The MySQL Keyring
-- * A locking service
-- * A function provides access to query attributes


-- 14.2 Loadable Function Reference
-- https://dev.mysql.com/doc/refman/8.4/en/loadable-function-reference.html

-- Table 14.2. Loadable Functions

-- Name -- Description -- Deprecated
asymmetric_decrypt() -- Decrypt ciphertext using private or public key
asymmetric_derive() -- Derive symmetric key from asymmetric keys
asymmetric_encrypt()
asymmetric_sing() -- Generate signature from digest
asymmetric_verify()
asynchronous_connection_failover_add_managed()
asynchronous_connection_failover_add_source()
asynchronous_connection_failover_delete_managed()
asynchronous_connection_failover_delete_source()
audit_api_message_emit_udf()
audit_log_encryption_password_get()
audit_log_encryption_password_set()
audit_log_filter_flush()
audit_log_filter_remove_filter()
audit_log_filter_remove_user()
audit_log_filter_set_filter()
audit_log_filter_set_user()
audit_log_read()
audit_log_read_bookmark()
audit_log_rotate()
create_asymmetric_priv_key()
create_asymmetric_pub_key()
create_dh_parameters() -- Generate shared DH secret
create_digest -- Generate digest from string


