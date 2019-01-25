#!/bin/sh

notmuch new

# Tag all mail under 'cscs' folder
notmuch tag +cscs -- tag:new and folder:'/cscs\/.*/'

# Tag support related emails
notmuch tag +support -- tag:new and mid:'/rt[-].+@cscs[.]ch/'
notmuch tag +hbp -- tag:new and from:'hpac-hbpsupport@bsc.es'
 
# Tag Cray related emails
notmuch tag +cray -- tag:new and folder:'cscs/aca/cray'
 
# Tag Future Systems related emails
notmuch tag +fs -- tag:new and folder:'cscs/aca/fs'

# Tag PyStella related emails
notmuch tag +fs +pystella -- tag:new and folder:'cscs/aca/fs/pystella'

# Tag GPU Env related emails
notmuch tag +tech -- tag:new and folder:'cscs/aca/gpu_env'

# Tag IDS related emails
notmuch tag +ids -- tag:new and folder:'/cscs\/aca\/ids.*/'

# Tag CCSIP related emails
notmuch tag +ccsip -- tag:new and folder:'cscs/aca/ids/ccsip'

# Tag GridTools related emails
notmuch tag +gridtools -- tag:new and folder:'/cscs\/aca\/ids\/gridtools.*/'
notmuch tag +gridtools +dsl -- tag:new and folder:'cscs/aca/ids/dsls'
notmuch tag +msc -- tag:new and folder:'cscs/aca/ids/gridtools/msc'
notmuch tag +riken -- tag:new and folder:'cscs/aca/ids/gridtools/riken'

# The following folders are tagged based on their folder
folders="hbp interns jira jupyter maestro psi sdsc"
for f in ${folders}; do
    notmuch tag +${f} -- tag:new and folder:"cscs/aca/ids/${f}"
done

# Tag SDP related emails
notmuch tag +sdp -- tag:new and folder:'/cscs\/aca\/ids\/sdp.*/'
notmuch tag +wp2 -- tag:new and folder:'cscs/aca/ids/sdp/wp2'
notmuch tag +wp3 -- tag:new and folder:'cscs/aca/ids/sdp/wp3'

# Tag Containers related emails
notmuch tag +containers -- tag:new and folder:'/cscs\/aca\/ids\/shifter.*/'
notmuch tag +tokyo -- tag:new and folder:'cscs/aca/ids/shifter/tokyo'

# Tag INBOX emails
notmuch tag +inbox -- tag:new and folder:'cscs/inbox'

# We've finished processing incoming mail
notmuch tag -new -- tag:new
