eksctl create iamserviceaccount \
  --cluster=tf-eks-wetravel \
  --namespace=kube-system \
  --name=aws-load-balancer-controller \
  --role-name "AmazonEKSLoadBalancerControllerRole" \
  --attach-policy-arn=arn:aws:iam::995105043624:policy/AWSLoadBalancerControllerIAMPolicy \
  --approve
helm install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName=tf-eks-wetravel \
  --set region=eu-central-1 \
  --set vpcId=vpc-0e2799bd64ae1b647 \
  --set image.repository=602401143452.dkr.ecr.eu-central-1.amazonaws.com/amazon/aws-load-balancer-controller \
  --set serviceAccount.create=false \
  --set serviceAccount.name=aws-load-balancer-controller 
