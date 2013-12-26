stratum-mining
==============

Basic implementation of bitcoin mining pool using Stratum mining protocol.

This fork includes a database implementation for:
	None
	Sqlite
	Mysql
	Postgresql

Basic worker stats are provided (and updated)

See the INSTALL file for install instructions.

For more info on Stratum:
http://mining.bitcoin.cz/stratum-mining.

Original version by Slush

Updated version by GeneralFault (Tips Welcome: 15Zk7DoFYJ7hESpZzmix1WLkomTMGW81c2 )

This version by Joe White http://pool.cr.rs (freicoin mining pool)

Joe's Stratum Mining Freicoin
Implementation of generalfault's https://github.com/generalfault/stratum-mining
that works with Mark Friedenbach's https://github.com/freicoin/stratum-mining
This isntallation can be put directly over top of your current pushpoold 


Known bugs:
Does not handle subscriptions properly upon connection, but properly pushes block template and everything submits without issue

To do:
add Joe's Pool front end in to implementation (simplebtc's implementation heavily modified)
add firewalls, security services, add google authenticator, add other things like tripwire.


how to:
Easy:
download vmware image
go to town
make sure to set up any and all firewalls, security measures, and other information.

manual:
first download freicoin from freico.in/downloads
install freicoin
edit your freicoin.conf file
change the rpc port for security (i like to mix it up on each server i use)


nano .freicoin/freicoin.conf

something like this works (freicoin.conf file):
server=1
rpcuser=changethisusername
rpcpassword=changethispassword
rpcport=4252
rpcallowip=127.0.0.1

test to make sure freicoind works



once you are sure of that, then get the git package

git clone 


make the stratum log directories

mkdir /stratum
mkdir /stratum/log/
touch /stratum/log/stratum.log

recurse in to the directory
and edit conf/config.py
MAKE SURE TO READ AND CONFIGURE ALL SETTINGS!!!!
I HAVE DISABLED PLUG AND PLAY FOR YOUR SAFETY/SECURITY
nano conf/config.py



ALWAYS BACK UP BEFORE STARTING ANYTHING!!!
YOUR DATABASE COULD GET SCREWED!
I CAN NOT BE HEALD LIABLE FOR ANYTHING,
ESP THAT!


import the database if you are starting from scratch (it is not standard and is not optimized,
you could opt to make your own database and edit DB_Mysql.py (or corresponding database)
and edit anything that is a sql execution (anything that has "select * from, or any other sql statements
can be easily updated without changing most or anythign on the server side

schema.sql <- THIS IS THE SCHEMA FOR THIS IMPLEMENTATION OF joe's

THIS SCHEMA IS NOT OPTIMIZED AT ALL!

ALWAYS BACK UP BEFORE STARTING ANYTHING!!!
YOUR DATABASE COULD GET SCREWED!
I CAN NOT BE HEALD LIABLE FOR ANYTHING,
ESP THAT!


start a new screen so you don't log out and stratum crashes (this is helpful for logging too)
screen

./startjoes.sh

it should load up and work, you will see one error on submission at this time it is okay
this error does not affect any pool performance, it is tested working.



please update this as there are many probable errors.
I have included the sql archetecture for this implementation
as it is not standard and can plug-and-play over an existing pushpool implementation

ALWAYS BACK UP BEFORE STARTING ANYTHING!!!
YOUR DATABASE COULD GET SCREWED!
I CAN NOT BE HEALD LIABLE FOR ANYTHING,
ESP THAT!
