/// Account-related routes (eg. "/account/login" or "/account/register").
pub mod account;
/// Various helper functions (eg. human-readable (de)serialization).
pub mod helpers;
/// The index page (eg. "/").
pub mod index;
/// Crate-dedicated pages (eg. "/crates/\<name\>").
pub mod krate;
/// Shortcut to account page (eg. "/me" -> "/account/manage").
pub mod me;
/// Search pages (eg. "/search?q=\<term\>").
pub mod search;
