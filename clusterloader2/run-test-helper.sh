# github.com/wardenlym
# mailto:wardenlym@gmail.com

# prepare images for all node before run tests

# docker pull  k8s.gcr.io/pause:3.1
# docker pull gcr.io/kubernetes-e2e-test-images/agnhost:2.2


# export varibles because golang code use os.Getenv to get them
export ETCD_CERTIFICATE=/home/ubuntu/etcd/ca.crt
export ETCD_KEY=/home/ubuntu/etcd/ca.key
export KUBE_SSH_KEY_PATH=/home/ubuntu/.ssh/id_rsa
# master node info
MASTER_NAME=master-01
MASTER_IP=172.29.50.31
MASTER_INTERNAL_IP=172.29.50.31
KUBE_CONFIG=/home/ubuntu/.kube/config

# i run my test cluster on baremetal machines
PROVIDER='local'
# i modify config to reduce test scale
TEST_CONFIG='./testing/density/config.yaml'
# directory to put test reports
REPORT_DIR='./reports'
# save logs output to help debugging
LOG_FILE='test.log'

./cmd/clusterloader --provider=$PROVIDER \
    --kubeconfig=$KUBE_CONFIG \
    --mastername=$MASTER_NAME \
    --masterip=$MASTER_IP \
    --master-internal-ip=$MASTER_INTERNAL_IP \
    --testconfig=$TEST_CONFIG \
    --report-dir=$REPORT_DIR \
    --alsologtostderr --v=3 2>&1 | tee $LOG_FILE
