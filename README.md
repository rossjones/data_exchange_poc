## Exchange

To start the proof of concept:

  * Clone the repository
  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


### Checking eligibility

In your prototype, and after you have asked the user to verify their identity,
redirect the user to ```/consent/blue_badge?bearer=BEARER_TOKEN&client=TOKEN``` to obtain their consent.

The ```BEARER_TOKEN``` is the token identifying the user, the ```TOKEN``` parameter is the client token.

If the user does not give consent, the user will be redirected to your prototype at a URL given in configuration.

If the user does give consent, the user will be redirected to your prototype at
the configured URL with a ```consent``` parameter. This parameter is a token that can be used to 'prove' the user gave consent for the following API call.

Now that your prototype has obtained consent, it is ready to make an API call to
get the results. The GET call should be made to ```/api/blue_badge``` and contain the following query string parameters

| Parameter | Description   |
|---|---|
| token | The token identifying the clinet |
| consent_token | The consent token obtained when the user gave consent |
| matched_data |  A JSON object containing the matched data for the user identifiedby the bearer token |

If the consent_token is valid and matches the bearer, then the matched_data will be used to determine the user's eligibility.  

A success result will be a JSON object that is structured as:

```JSON
{
  "eligible": true,
  "matched": true,
  "attribute": {
    "key": "value"
  }
}
```

A failed result that was matched will be a JSON object that looks like:

```JSON
{
  "eligible": false,
  "matched": true
}
```
A failed result that was not matched will be a JSON object that looks like:

```JSON
{
  "eligible": false,
  "matched": false
}
```

### TODO

* Create PoC happy path
* Create PoC sad paths
* Allow configuration of clients (should be OAuth2 tokens really)
* Add another endpoint (parking_permit)
* Provide skeleton of the schema for matched data
* Create 'actual' (but fake) tokens and expire them.
