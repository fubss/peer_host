# Before running this script make sure that:
# - the overlay network fabric_test was run on the manager docker swarm node
# - binaries was saved to the directory /peer_host/bin-${STATEDBNAME}


## Parse mode
if [[ $# -lt 1 ]] ; then
  echo "Usage (lowcase): ./start_peer.sh statedbname"
  exit 0
fi

# parse a statedb subcommand if used
if [[ $# -ge 1 ]] ; then
  export STATEDBNAME="$1"
  shift
fi



#set the globals
cd ~/peer_host/test-peer
export PATH=${PWD}/../bin-${STATEDBNAME}:$PATH

#run the peer
./peer.sh up -ca