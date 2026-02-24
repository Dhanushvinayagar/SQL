ACID stands for Atomicity, Consistency, Isolation, and Durability.

1.Atomicity

A transaction is treated as a single unit — it either completes entirely or does not happen at all.

Example:
Imagine transferring $500 from Account A to Account B:

$500 is deducted from A
$500 is added to B

If the system crashes after deducting from A but before adding to B, the whole transaction is rolled back,
so no money is lost.

“All or nothing.”

2. Consistency

A transaction brings the database from one valid state to another valid state, following all rules (constraints, triggers, etc.).

Example:
If a bank rule says the total money must remain constant:

Before transfer: A + B = $10,000

After transfer: A + B must still equal $10,000

If a transaction violates constraints (e.g., negative balance not allowed), it fails.

Data always follows defined rules.

3. Isolation

Transactions running at the same time do not interfere with each other.

Example:
Two people booking the last seat on a flight:

Only one transaction should succeed.

The other should fail.

The database ensures transactions behave as if they ran one after another.

No conflicting reads.

4️. Durability

Once a transaction is successfully committed, it is permanently saved, even if the system crashes.

Example:
After you receive confirmation of a ticket booking, the reservation remains saved — 
even if the server restarts immediately after.

Committed data will not be lost even if the system crashes.
