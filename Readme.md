# Matcher

## Dependencies
- bundler: 2.3.8
- ruby: 2.6.3
- minitest: 5.11.3


## Rules
Task 1.- Write a matcher based on the following matching specifications/rules.

Given a list of names in a database i.e (Julia, Li, Shonda). Users of a web application can use a search form, which allows searching for users using the first 3 characters that match based on the rules below.

- Ignore surrounding white space
- Accept match on first 3 chars (e.g. Jon for Jones) is a match
- Reject match on less than 3 chars (e.g. Jo for Jones) is not a match
- Accept exact match for 2 char name (e.g. Li for Li) is a match
- Reject mismatch on chars beyond 3 (e.g. reject Julius for Julia)


## Run tests

`rake tests`