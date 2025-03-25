

## CHG0466150


1. Upgrade Kubernetes (K8s) version – sggastlyseaprodaks001 AKS Cluster & respective Node Pools from version 1.26.x to 1.27.x
2. This is required since the current K8s version is out of Microsoft support soon. 
3. To stay intact with MS Support, upgrade the current K8s version to next higher version to 1.27.x. Microsoft recommends always maintain K8s version to N-2 version for availing regular updates and support.

1.	Log into the portal and check the AKS Cluster details (tenant & subscription).
2.	Connect to required AKS Cluster using Azure Portal either CLI mode
3.	Disable the POD Disruption Budget (PDB) to move the PODs on the existing Node to the new buffer Node.
4.	Select the desired Control Plane (Master Node) K8s version from the available list.
5.	Select the desired version from the K8s version list
6.	Validate the Control Plane is upgraded to the desired version.
7.	Upgrade the Node Pools, go to the 'Node Pools' (Worker Nodes) menu item instead.
8.	Select the desired K8s version for 'Node Pools' from the available list.
9.	Upgrade Node Pool/s to desired version in sequential order.
10.	Validate the Node Pools are upgraded to the desired version.
11.	After successful Cluster/Node Pool upgrade revert PDB to actual configuration for all respective PDB applications.
12.	Make sure all the Kubernetes workloads (PODs, Deployments, and Services) are running fine.
13.	Confirm to the project teams about the Kubernetes version upgrade.
14.	Application Team has to test their Applications Workloads (PODs, Deployments, Services) are running as expected.


1.	Log into the portal and check the AKS Cluster details (tenant & subscription).
2.	Connect to the AKS Cluster
3.	Try reconciling the AKS Cluster by az aks update <cluster-name> <resource-group-name>.
4.	Manually cancel the K8s version upgrade operations by executing az aks operation-abort through Azure CLI prompt from the Linux Jump Server.
5.	Troubleshoot the issue and create a high priority with Microsoft on required basis to quickly fix the issue.


https://learn.microsoft.com/en-us/troubleshoot/azure/azure-kubernetes/cluster-node-virtual-machine-failed-state



