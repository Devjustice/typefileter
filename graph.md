graph TD
    A[Test Legitimate Upload] --> B{Fail?}
    B -->|Yes| C[Identify Filter Layer]
    C --> D[Extension Bypass]
    C --> E[Content Bypass]
    C --> F[MIME Spoofing]
    D --> G[Test Double Extensions]
    E --> H[Add Magic Bytes]
    F --> I[Spoof Content-Type]
    G --> J{Success?}
    H --> J
    I --> J
    J -->|No| K[Combine Techniques]
    K --> L[Final Payload]
