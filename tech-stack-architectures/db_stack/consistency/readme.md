# 1. Eventual Consistency (Asynchronous Replication)

## 1.1. MySQL

- ### Architecture: Single Master, Multiple Slaves (Asynchronous Replication)
    - **Description**: The master node handles writes, while slaves handle read operations. Replication from master to slaves is asynchronous, which means slaves may lag behind the master, leading to eventual consistency.  
    - **Consistency**: Eventual, since there may be delays in propagating updates to slaves.

- ### Architecture: Multi-Master, Multi-Slave (Asynchronous Replication)
    - **Description**: Multiple masters can handle both reads and writes, with asynchronous replication between them. Slaves replicate from specific masters, creating eventual consistency between masters and their respective slaves.  
    - **Consistency**: Eventual, as the nodes won’t immediately sync across all masters.

- ### Architecture: Leaderless
    - **Description**: No Native Supports for leaderless architecture.

## 1.2. PostgreSQL

- ### Architecture: Single Master, Multiple Slaves (Asynchronous Replication)
    - **Description**: One master node handles writes, and slaves replicate data asynchronously. Slaves may not be fully up-to-date, leading to eventual consistency across the nodes.  
    - **Consistency**: Eventual.

- ### Architecture: Multi-Master, Multi-Slave (Asynchronous Replication)
    - **Description**: Each master writes to its own set of slaves, with replication between masters being asynchronous, resulting in eventual consistency.  
    - **Consistency**: Eventual.

- ### Architecture: Leaderless
    - **Description**: No Native Supports for leaderless architecture.

## 1.3. MongoDB

- ### Architecture: Single Master, Multiple Slaves (Asynchronous Replication)
    - **Description**: In a MongoDB replica set, the primary node handles all write operations, while secondary nodes replicate the data asynchronously from the primary. This means that secondary nodes may lag behind the primary, leading to eventual consistency across the cluster.  
    - **Consistency**: Eventual, as updates may not immediately reach all secondaries.

- ### Architecture: Multi-Master, Multi-Slave (Sharding with Asynchronous Replication)
    - **Description**: Multiple shards act as masters, handling writes for their part of the data. Replication to secondaries is asynchronous, leading to eventual consistency between the replicas of each shard.  
    - **Consistency**: Eventual.
- ### Architecture: Leaderless (Replica Set with Write Concern “w=1”)
    - **Description**: In a leaderless architecture, MongoDB nodes accept writes and reads independently. With write concern `w=1`, the primary node writes data, and the system acknowledges the write once the primary completes it, without waiting for the replication to secondary nodes. Thus, eventual consistency occurs as secondary nodes may lag behind.  
    - **Consistency**: Eventual, since replication to secondaries is asynchronous.



# 2. Strong Consistency (Synchronous Replication)

## 2.1. MySQL

- ### Architecture: Single Master, Multiple Slaves (Semi-Synchronous Replication)
    - **Description**: The master node writes data and waits for at least one slave to confirm receipt before committing the transaction. This ensures stronger consistency, as at least one replica has received the write before the transaction is considered complete.  
    - **Consistency**: Strong, though lagging slaves may still be out of sync temporarily.

- ### Architecture: Multi-Master, Multi-Slave (Semi-Synchronous Replication between Masters)
    - **Description**: Masters replicate synchronously between each other, ensuring consistent writes across multiple nodes. Slaves, however, may still replicate asynchronously, so some slaves may lag behind their respective masters.  
    - **Consistency**: Strong between masters, eventual between slaves.

- ### Architecture: Leaderless
    - **Description**: No Native Supports for leaderless architecture.
## 2.2. PostgreSQL

- ### Architecture: Single Master, Multiple Slaves
    - **Description**: The master node writes data and waits for a specific number of slaves (configurable) to confirm replication before committing the transaction. This ensures strong consistency across the cluster.  
    - **Consistency**: Strong.

- ### Architecture: Multi-Master, Multi-Slave (Synchronous Replication between Masters)
    - **Description**: Multiple masters replicate synchronously, while slaves can replicate from their respective masters. Synchronous replication between masters ensures consistency between write operations.  
    - **Consistency**: Strong between masters, eventual between slaves.

- ### Architecture: Leaderless
    - **Description**: No Native Supports for leaderless architecture.
## 2.3. MongoDB

- ### Architecture: Replica Set (Write Concern “w=majority”)
    - **Description**: MongoDB’s replica sets can be configured to write with `writeConcern: {w: "majority"}`. This means that a write operation will not be acknowledged until the majority of nodes have confirmed it, ensuring that reads from any node will be consistent.  
    - **Consistency**: Strong.

- ### Architecture: Multi-Master, Multi-Slave (Sharding with Write Concern “w=majority”)
    - **Description**: Writes across the shards are confirmed by a majority of replica nodes within each shard, leading to strong consistency for read operations from any node.  
    - **Consistency**: Strong.

- ### Architecture: Leaderless
    - **Description**: MongoDB isn't truly leaderless but can achieve strong consistency in replica sets using writeConcern: {w: "majority"} and readPreference: "primary". This ensures that writes are acknowledged by the majority of nodes, and reads return the most recent data from the primary. 
    - **Consistency**: Approximate strong.

# 3. Casual Consistency (Eventual Consistency with More Constraints)

## 3.1. MySQL
- ### Architecture: Single Master, Multiple Slaves (Asynchronous Replication with Read Preferences)
  - **Description:** The master handles writes, while slaves serve read operations. Clients may choose to read from slaves, which can lead to casual consistency, as reads from slaves may return slightly stale data but are generally consistent with the last writes.
  - **Consistency:** Casual, since reads may reflect the most recent writes on the master but can be out of sync with the latest data.

- ### Architecture: Multi-Master, Multi-Slave (Asynchronous Replication with Conflict Resolution)
  - **Description:** Multiple masters allow writes, and asynchronous replication with conflict resolution strategies ensures that reads from any master reflect a consistent state across the system, but not necessarily the most up-to-date state.
  - **Consistency:** Casual, as conflicts are resolved, but there may be delays in reflecting the latest writes.

- ### Architecture: Leaderless**
  - **Description:** No Native Support for casual consistency; implementing casual consistency would require application-level management of write and read operations to ensure coherence without a clear leader.

## 3.2. PostgreSQL
- ### **Architecture: Single Master, Multiple Slaves (Asynchronous Replication with Read Preferences)
  - **Description:** Writes are handled by the master, while slaves may serve read operations. By allowing reads from slaves, which may not be fully synchronized, this setup introduces casual consistency, where reads may reflect updates not yet propagated to all slaves.
  - **Consistency:** Casual, as it allows for some staleness in read data while generally being consistent with the master.

- ### Architecture: Multi-Master, Multi-Slave (Asynchronous Replication with Conflict Resolution)
  - **Description:** Each master handles writes independently, and slaves replicate asynchronously. Conflict resolution mechanisms ensure that reads can return a consistent state, although they might not always reflect the most recent write.
  - **Consistency:** Casual, as the system balances updates with replication delays, leading to potentially outdated reads.

- ### Architecture: Leaderless
  - **Description:** PostgreSQL does not natively support a leaderless model. Casual consistency would require a custom implementation, ensuring that clients manage read and write operations coherently.

## 3.3. MongoDB
- ### Architecture: Replica Set (Read Preferences)
  - **Description:** In a MongoDB replica set, the primary handles all write operations, while secondary nodes replicate asynchronously. By allowing clients to read from secondaries, casual consistency is achieved, where reads may return stale data but remain generally consistent with the primary.
  - **Consistency:** Casual, as secondary reads can lag behind the primary but still maintain a degree of consistency.

- ### Architecture: Sharding with Asynchronous Replication (Read Preference for Shards)
  - **Description:** Multiple shards handle writes, and secondary replicas replicate asynchronously. Clients can read from different shards, leading to casual consistency as updates may not yet be reflected across all shards.
  - **Consistency:** Casual, as the asynchronous nature of replication allows for stale reads.

- ### Architecture: Leaderless (Replica Set with Write Concern "w=1")
  - **Description:** In this model, writes can be acknowledged by a single node. This allows for high availability but may result in casual consistency since updates are not guaranteed to be immediately visible across all nodes.
  - **Consistency:** Casual, as the lack of strict synchronization allows for outdated reads across nodes.
