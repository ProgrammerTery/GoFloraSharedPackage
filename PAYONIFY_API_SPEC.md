# Payonify API Specification

## Base URL
```
https://api.payonify.com
```

## Authentication
**Method:** HTTP Basic Authentication

**Header Format:**
```
Authorization: Basic base64(publishable_key:secret_key)
```

**API Key Types:**
- **Secret Key** (`sk_`): Server-side only, full API access
  - Test: `sk_test_*`
  - Live: `sk_live_*`
- **Publishable Key** (`pk_`): Client-side safe, limited operations
  - Test: `pk_test_*`
  - Live: `pk_live_*`

**Required Headers:**
```
Content-Type: application/json
Authorization: Basic <credentials>
```

## Authentication Errors
- `missing_credentials` - Authorization header absent or malformed
- `invalid_publishable_key` - Key doesn't exist or invalid
- `invalid_secret_key` - Secret key incorrect or mismatched
- `unauthorized` - Access denied for resource/action

---

## Charges API

### 1. Create a Charge
**Endpoint:** `POST /v1/charges`

**Request:**
```json
{
  "amount": 100,                    // integer, required, min: 100 (in smallest unit)
  "currency": "usd",                // enum, required: "usd" | "zwg"
  "source": "web",                  // enum, required: "pos" | "web" | "mobile" | "ussd"
  "description": "Payment for...",  // string, optional, 4-150 chars
  "payment_method": {               // object, optional
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"  // string
      }
      // OR
      "onemoney": {
        "mobile_number": "0771234567"
      }
    }
  },
  "metadata": {                     // object, optional, max 5 keys
    "order_id": "12345",
    "customer_id": "cust_456"
  },
  "confirm": false,                 // boolean, optional, default: false
  "receipt_email": "user@example.com",  // email, optional
  "statement_descriptor": "GO FLORA",   // string, optional, 4-22 chars
  "shipping": {                     // object, optional
    "name": "John Doe",
    "carrier": "DHL",
    "tracking_number": "TRK123",
    "phone": "0771234567",
    "address": {
      "line1": "123 Main St",
      "line2": "Apt 4",
      "city": "Harare",
      "province": "Harare",
      "country": "Zimbabwe"
    }
  },
  "return_url": "https://example.com/return"  // URI, optional
}
```

**Response (200):**
```json
{
  "id": "ch_a7eryb3kdb6ljkzqe5vg3jbf",
  "object": "charge",
  "amount": {
    "value": 100,
    "currency": "usd"
  },
  "livemode": false,
  "created": 1234567890,            // Unix timestamp
  "paid": false,
  "metadata": {
    "order_id": "12345"
  },
  "client_secret": "ch_a7ery..._secret_xyz",
  "payment_method": "pm_xyz123",    // string (ID of payment method)
  "description": "Payment for...",
  "receipt_email": "user@example.com",
  "return_url": "https://example.com/return",
  "statement_descriptor": "GO FLORA",
  "shipping": { /* same as request */ },
  "refund_reference": null,         // string | null
  "status": "requires_authorization",  // enum (see below)
  "failure_code": null,             // string | null
  "failure_reason": null,           // string | null
  "cancelled_at": null,             // integer | null (Unix timestamp)
  "cancellation_reason": null,      // enum | null (see below)
  "payment_method_details": {
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"
      }
    }
  }
}
```

**Charge Status Enum:**
- `requires_payment_method`
- `requires_authorization`
- `pending`
- `succeeded`
- `failed`
- `cancelled`

**Cancellation Reason Enum:**
- `duplicate`
- `fraudulent`
- `abandoned`
- `requested_by_customer`

### 2. Retrieve a Charge
**Endpoint:** `GET /v1/charges/{id}`

**Path Parameters:**
- `id` (string, required)

**Response (200):** Same as Create Charge response

### 3. Confirm a Charge
**Endpoint:** `POST /v1/charges/{id}/confirm`

**Path Parameters:**
- `id` (string, required)

**Request:**
```json
{
  "payment_method": {               // object, required
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"
      }
    }
  },
  "description": "Updated description",  // string, optional
  "metadata": {},                   // object, optional
  "receipt_email": "user@example.com",  // email, optional
  "statement_descriptor": "GO FLORA",   // string, optional
  "shipping": {},                   // object, optional
  "return_url": "https://example.com/return"  // URI, optional
}
```

**Response (200):** Same as Create Charge response

### 4. Cancel a Charge
**Endpoint:** `POST /v1/charges/{id}/cancel`

**Path Parameters:**
- `id` (string, required)

**Request:**
```json
{
  "cancellation_reason": "requested_by_customer"  // enum, optional
}
```

**Response (200):** Same as Create Charge response

### 5. List All Charges
**Endpoint:** `GET /v1/charges`

**Query Parameters:**
- `limit` (integer, 1-100, default: 10)
- `first` (integer, 1-100)
- `after` (string) - cursor for forward pagination
- `last` (integer, 1-100)
- `before` (string) - cursor for backward pagination
- `status` (enum): requires_payment_method | requires_authorization | pending | succeeded | failed | cancelled
- `currency` (enum): usd | zwg
- `start_date` (date, ISO 8601)
- `end_date` (date, ISO 8601)

**Response (200):**
```json
{
  "object": "list",
  "data": [
    { /* charge object */ }
  ],
  "paging": {
    "after": "cursor_string",
    "before": "cursor_string",
    "has_more": true
  }
}
```

---

## Payouts API

### 1. Validate a Payout Recipient
**Endpoint:** `POST /v1/payouts/validate`

**Request:**
```json
{
  "destination": {                  // object, required
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"  // string, required
      }
      // OR
      "onemoney": {
        "mobile_number": "0771234567"
      }
    }
  }
}
```

**Response (200):**
```json
{
  "valid": true,                    // boolean
  "recipient": {                    // object (when valid)
    "name": "John Doe",
    "account_status": "active",
    "mobile_number": "0771234567"
  }
}
```

### 2. Create a Payout
**Endpoint:** `POST /v1/payouts`

**Request:**
```json
{
  "amount": 100,                    // integer, required, min: 100
  "currency": "usd",                // enum, required: "usd" | "zwg"
  "destination": {                  // object, required
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"
      }
    }
  },
  "description": "Payout for...",   // string, optional, max 150 chars
  "metadata": {                     // object, optional, max 5 keys
    "driver_id": "drv_123"
  }
}
```

**Response (201):**
```json
{
  "id": "po_xyz123abc",             // string (prefix: po_)
  "object": "payout",
  "amount": {
    "value": 100,
    "currency": "usd"
  },
  "created": 1234567890,            // Unix timestamp
  "livemode": false,
  "status": "pending",              // enum: "pending" | "paid" | "failed"
  "destination": {
    "mobile_money": {
      "ecocash": {
        "mobile_number": "0771234567"
      }
    }
  },
  "description": "Payout for...",
  "metadata": {
    "driver_id": "drv_123"
  },
  "failure_code": null,             // string | null
  "failure_message": null           // string | null
}
```

### 3. Retrieve a Payout
**Endpoint:** `GET /v1/payouts/{id}`

**Path Parameters:**
- `id` (string, required)

**Response (200):** Same as Create Payout response

### 4. List All Payouts
**Endpoint:** `GET /v1/payouts`

**Query Parameters:**
- `limit` (integer, 1-100, default: 10)
- `after` (string) - cursor for forward pagination
- `before` (string) - cursor for backward pagination
- `status` (enum): pending | paid | failed
- `currency` (enum): usd | zwg
- `start_date` (date, ISO 8601)
- `end_date` (date, ISO 8601)

**Response (200):**
```json
{
  "object": "list",
  "data": [
    { /* payout object */ }
  ],
  "paging": {
    "after": "cursor_string",
    "before": "cursor_string",
    "has_more": true
  }
}
```

---

## Webhooks

### Event Types

**Charge Events:**
- `charge.succeeded` - Payment processing succeeded
- `charge.failed` - Payment processing failed

**Checkout Events:**
- `checkout.succeeded` - Session completion succeeded
- `checkout.failed` - Session completion failed

**Refund Events:**
- `refund.succeeded` - Refund processing succeeded
- `refund.failed` - Refund processing failed

**Payout Events:**
- `payout.succeeded` - Fund disbursement succeeded
- `payout.failed` - Fund disbursement failed

### Webhook Payload Structure

```json
{
  "id": "evt_xyz123",               // Event ID
  "object": "event",
  "type": "charge.succeeded",       // Event type
  "created": 1234567890,            // Unix timestamp
  "livemode": false,
  "data": {
    "object": {
      /* Full charge/payout/refund object */
    }
  }
}
```

### Signature Verification

**Header:** `Payonify-Signature`

**Format:** `t={timestamp},v1={signature}`

**Verification Steps:**
1. Extract timestamp (`t`) and signature (`v1`) from header
2. Concatenate: `{timestamp}.{raw_request_body}`
3. Generate HMAC-SHA256 using webhook secret
4. Compare computed signature with received `v1` value
5. Validate timestamp is within 5 minutes

**Security Notes:**
- Never expose webhook secret in client-side code or public repositories
- Always verify signatures before processing
- Use HTTPS endpoints in production
- Implement idempotency by tracking event IDs

### Webhook Best Practices

- Respond with HTTP 200 immediately
- Defer heavy processing to background jobs
- Track event IDs to prevent duplicate processing
- Payonify retries failed deliveries with exponential backoff (up to 10 attempts)
- Monitor server clock synchronization for timestamp validation

---

## Error Handling

### Error Response Structure

```json
{
  "type": "invalid_request_error",  // General error category
  "code": "missing_required_field", // Specific error code
  "message": "The amount field is required.",  // Human-readable explanation
  "param": "amount",                // Field that caused error (if applicable)
  "doc_url": "https://docs.payonify.com/errors/missing_required_field"
}
```

### Error Categories

**Authentication Issues:**
- Missing/malformed credentials
- Invalid keys
- Revoked access
- Suspended accounts

**Validation Problems:**
- Missing required fields
- Invalid parameters
- Malformed data
- Unsupported payment methods

**Transaction Failures:**
- Charge/refund operations that can't proceed
- Invalid state (pending, failed, already refunded)

**Payout Limitations:**
- Missing provider configuration
- Disabled B2C transfers

**Provider/Gateway Issues:**
- Third-party payment platform errors
- Timeouts
- Unavailability
- Rate limits (HTTP 429)

### Rate Limiting

- API implements rate limiting
- Exceeding limits returns HTTP 429 "Too Many Requests"
- Contact support@payonify.co.zw for higher limits

---

## Payment Methods

### Supported Mobile Money Providers

1. **EcoCash** - Zimbabwe's leading mobile money service
2. **OneMoney** - NetOne mobile money service
3. **ZimSwitch** - Interbank payment gateway
4. **Visa/Mastercard** - Card payments (via checkout sessions)

### Test Mobile Numbers

For sandbox testing, use numbers with `772` prefix:
- Success scenarios: Various test numbers provided
- Failure scenarios: Specific test numbers for error handling

---

## API Conventions

### Versioning
All endpoints use `/v1/` prefix

### Response Format
All responses are JSON

### Date/Time Format
- Timestamps: Unix timestamps (integer)
- Dates: ISO 8601 format

### Currency Amounts
- Amounts are integers in smallest currency unit (cents)
- USD: amount in cents (100 = $1.00)
- ZWG: amount in cents (100 = ZWG 1.00)

### Pagination
- Cursor-based pagination using `after` and `before` parameters
- `has_more` indicates additional pages
- Default limit: 10, max: 100

### Idempotency
- Track event IDs in webhook handling
- Prevents duplicate processing

### Status Monitoring
- Check status.payonify.com for service status before debugging issues
