# HDE-DNS-etcd
Host Data Engine(HDE) for KV of name mapping priority in etcd store.
### what host data stand for?
We capture each entry of request and store necessary information for data science.
### host data component
- host: request host IP address.
- region: where this request from?
- service: what services be requested, lead to the load the host takes.
- ctlPerf: how this service be needed?
- workload: how weight this host be monitored, corresponding to reset trigger.
- count: what time this host be connected from last reset.
- ms: how fast is the most recent response.
- node: how many hopping nodes which depends on region of request.
### where is the host data heading to?
While capturing each host data, we will send to collector for management; and then, this mechanism through controller to pack up effective data for transferring with HTTP method overall the procedure.
