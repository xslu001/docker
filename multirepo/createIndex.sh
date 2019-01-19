#!/bin/bash
NEWREPO=$1

LOCKFILE=/var/run/opengrok-indexer-${NEWREPO}
NEWREPODIR=${VAR_OPENGROK_ROOT}/${NEWREPO}
SOURCEDIR=${NEWREPODIR}/src
DATADIR=${NEWREPODIR}/data
CONFIGFILE=${NEWREPODIR}/etc/configuration.xml

if [ -f "$LOCKFILE" ]; then
    date +"%F %T Indexer still locked, skipping indexing"
    exit 1
fi

touch $LOCKFILE
date +"%F %T Indexing starting"
opengrok-indexer \
    -a /opengrok/lib/opengrok.jar -- \
    -s ${SOURCEDIR} -d ${DATADIR} -H -P -S -G \
    -W ${CONFIGFILE} -U http://localhost:8080/${NEWREPO}
rm -f $LOCKFILE
date +"%F %T Indexing finished"
