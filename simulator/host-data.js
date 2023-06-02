const server = require('fastify')();

let host_prim = {
    name: "host1",
    workload: 0,
    count: 0,
    scores: 100
};

let host_secn = {
    name: "host2",
    workload: 0,
    count: 0,
    scores: 100
};

let hosts = [host_prim, host_secn];
let hini = hosts;
let errMsg = JSON.stringify({"error":"not found"});


server.get('/hdSimu', function (req, res) {
    console.log('request url is '+req.url);
	return hosts;
});

server.get('/hdSimu/ini', function (req, res) {
    console.log('request url is '+req.url);
	let hosts = hini;
	return hosts;
});

server.get('/hdSimu/:name/:service', function (req, res) {
    console.log('request url is '+req.url);
	let dest = req.params.name;
	let usage = req.params.service;
	let wl = 0;
	if (usage === 'index.html')
		wl = 10;
	else
		wl = 40;
	
	// retrieve host w/ name
	let host = hosts.find(element => element.name === req.params.name);
	host.workload+=wl;
	host.count++;
	let w = host.count;
	if (w <= 10)
		w=1;
	else
		w=2;
	host.scores+=-wl/10-w;
	// console.log(dest+' :this host scores nowadays is '+hosts);
	console.log(dest+' :this host scores nowadays is '+host.scores);
	
	if (!host) {
		console.log(errMsg);
		return errMsg;
	}
	else
		return hosts;
});

server.post('/hdSimu', function (req, res) {
    // 依Lab說明寫作
	console.log('request url is '+req.url);
	let newRider = req.body;
	hosts.push(newRider);
	return {count: hosts.length};
});

server.put('/hdSimu/:name', function (req, res) {
    // 依Lab說明寫作
	console.log('request url is '+req.url);
	// retrieve index of name in query path
	let index = hosts.findIndex(element => element.name === req.params.name);
	console.log('update index:'+index+' with new data:');
	console.log(req.body);
	hosts[index]=req.body;
	return hosts[index];
});


server.listen(30001, "127.0.0.1");
/* 
@author CWayneH
https://github.com/CWayneH/DSys/tree/main/Lab2
*/