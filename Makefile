# Makefile for pkdgrav or gasoline (specify below)
# Then type make <platform>
# <platform> should be one of:
# null, sgi, pvm, pthread, pthread_dec, pthread_sgi, ampi, lam_mpi, qmpi, mpi,
# spx, t3d, t3dmpi, t3empi, ksr, charm
#
# You will get a pair of new files: gasoline.NNNNNNNN and buildlog.NNNNNNNN,
# where NNNNNNNN is an 8 character hash.
# The first is the actual gasoline executable, and the second one contains all
# defines that were used to build gasoline.  You should copy that file into 
# the directory of any simulation you run so you know exactly which options were
# used.
PNG_INCL =
PNG_LIB = 
PNG_OBJ =
PNG_DEF = 

# If you do dump frame stuff with png you need these libs ( -DUSE_PNG )
#PNG_INCL = -I/usr/include
#PNG_LIB = -L/usr/lib -lpng -lz
#PNG_OBJ = writepng.o
#PNG_DEF = $(PNG_INCL) -DUSE_PNG

BASE_LD_FLAGS = $(PNG_LIB) 

# The following pairs of lines define which cooling method to use.  Uncomment 
# only one pair
#COOLING_OBJ = cooling_cosmo.o
#COOLING_DEF = -DCOOLING_COSMO

#COOLING_OBJ = cooling_bate.o
#COOLING_DEF = -DCOOLING_BATE

COOLING_OBJ = cooling_metal.o
COOLING_DEF = -DCOOLING_METAL

#COOLING_OBJ = cooling_metal_H2.o
#COOLING_DEF = -DCOOLING_MOLECULARH

#COOLING_OBJ = cooling_metal_noH2.o
#COOLING_DEF = -DCOOLING_METAL_NOH2

#COOLING_OBJ = cooling_planet.o
#COOLING_DEF = -DCOOLING_PLANET

#COOLING_OBJ = cooling_disk.o
#COOLING_DEF = -DCOOLING_DISK

#COOLING_OBJ = 
#COOLING_DEF = -DNOCOOLING


# Which C compiler should I use?
CC = gcc

CC_DEF = 
CODE_DEF = 

# Gasoline uses a number of defines to enable/disable code features,
# debug sections of the code, and switch out different physics.
# Below is a complete list of the available user defines for gasoline.
# Most of them will NEVER be useful to you, as gasoline includes a lot of
# very case-specific code.  If you don't know what a define means, you probably
# don't need it.  The uncommented ones that come in the repository are probably fine.
# Simply uncomment a line to enable that define, or comment it to disable it.

#CODE_DEF += -DAGGS #Include support for aggregates (like asteroids and rubble piles) See aggs.c
#CODE_DEF += -DAGGSCLEANUP #Comments suggest this define includes incomplete code.
#CODE_DEF += -DASSERTENEG #A useful debugging option for ensuring that the energy generated by cooling is positive
#CODE_DEF += -DBENCHMARK #This is self-explanatory.  Not good for actual simulations.
#CODE_DEF += -DCCC #Turn off stdout buffering
CODE_DEF += -DCHABRIER #Use the Chabrier 2003 IMF for starformation (See DOI:10.1086/376392)
CODE_DEF += -DCHANGESOFT #Allow you to explicitly give the softening length for gravity
#CODE_DEF += -DCHECKSF #Add additional outputs to check on star formation
#CODE_DEF += -DCHECKSOFT #A pile of debugging for the gravitational softening
#CODE_DEF += -DCLOUDY #Use CLOUDY version of line cooling
#CODE_DEF += -DCOLLISIONS #Include solid-body collisions
#CODE_DEF += -DCOLORCODE #Color the particles and keep track of them (movie making?)
#CODE_DEF += -DCOLUMNLENGTH #Use the smoothing length for the correlation length in Charlotte Christensen's H2 code
#CODE_DEF += -DCOMPLETE_LOCAL #Use complete (rather than partial) multipole expansion
#CODE_DEF += -DCOOLING_METAL_BROKEN #Debug lines for outputting some extra data for debugging cooling_metal
#CODE_DEF += -DCUBICTABLEINTERP #Use a higher order interpolation for the cooling table
#CODE_DEF += -DDEBUG #Various extra prints etc.
#CODE_DEF += -DDEBUG2 #Extra outputs to check treezip is working
#CODE_DEF += -DDEBUGTRACK #Extra debugging checks for dumpframe
#CODE_DEF += -DDELTAACCELACTIVE #Check that only active particles are used for updating a particles timestep
#CODE_DEF += -DDELTACCELCAP #Make sure that a particles neighbours have a say in it's timestep.
#CODE_DEF += -DDENSITYU #Generate the energy density of a particle (used in starformation?)
#CODE_DEF += -DDENSSOFT #Use the SPH density for gravity softening
#CODE_DEF += -DDEPTHCHECK #Debug how deep the tree goes during treebuilds
CODE_DEF += -DDIFFUSION #Enable Metal Diffusion
#CODE_DEF += -DDIFFUSIONPRICE #Daniel Price's Thermal Diffusion
CODE_DEF += -DDIFFUSIONTHERMAL #Thermal Diffusion
#CODE_DEF += -DDIVVOFF #Remove the convergent flow requirement for starformation
#CODE_DEF += -DDKDENSITY #Calculate the density using the derivative of the kernel in the DVDX calculation of density
CODE_DEF += -DDODVDS #Better handling of viscosity with the Balsara switch
#CODE_DEF += -DDRHODT #Use the change in density over time (dRho/dt) as a timestep criteria
#CODE_DEF += -DDRHODTDIVOUT #Output Divv variables used in DRHODT
#CODE_DEF += -DDRHODTTEST #Output a large list of properties important for the DRHODT parts of the code for debugging
#CODE_DEF += -DEPSACCH #Turning this one makes the pkd code ignore dhMinOverSoft in pkdAccelStep
#CODE_DEF += -DINELASTIC #Use the experimental inelastic collapse for collisions.
#CODE_DEF += -DFITDVDX #Use a fitted version of the DenDVDX that doesn't use the stiff.h evaluator.
#CODE_DEF += -DFREEZENONGAS #Force nongas particles to zero velocity.
CODE_DEF += -DGASOLINE #Do SPH (without this, compiles pkdgrav, just N-Body)
#CODE_DEF += -DGLASS #Use this to make glass initial conditions
#CODE_DEF += -DGR_DRAG #Enable Frame draggin (I believe)
#CODE_DEF += -DGROWMASS #Allow collisional particles to grow
#CODE_DEF += -DHSHRINK #M4 kernel times (pi/6)^(1/3) for a tighter kernel
#CODE_DEF += -DINFLOWOUTFLOW #Enable inflow/outflow boundary conditions
#CODE_DEF += -DJEANSFIXPDV #Correct PdV work when using a Jeans floor (dResolveJeans)
#CODE_DEF += -DJEANSSF #Use a simple Jeans length criteria for starformation
#CODE_DEF += -DJEANSSOFT #Force the smoothing & softening length to be at least as small as the Jeans scale
#CODE_DEF += -DJEANSSOFTONLY #Only force the softening length to be as small as the Jeans scale
#CODE_DEF += -DJWFORCE #Use an alternate way for calculating Pressures (I don't fully understand how this works)
#CODE_DEF += -DKROUPA #Use the Kroupa IMF (from Kroupa et al 1993 Bibcode:1993MNRAS.262..545K)
#CODE_DEF += -DKROUPA01 #Use the newer Kroupa 01 IMF (DOI:10.1046/j.1365-8711.2001.04022.x)
CODE_DEF += -DLONGRANGESTEP #Predict what particles will need to be put onto a longer timestep.
#CODE_DEF += -DM43D #Use a fancier 3D derived M4 Kernel
#CODE_DEF += -DMASSDIFF #Enable Mass diffusion (probably not a good idea right now)
#CODE_DEF += -DMODBATEPOLY #Use a polytropic equation of state with COOLING_BATE
#CODE_DEF += -DMOLECFRAC_SF_CUTOFF #Add a molecular hydrogen threshold for starformation (10% H2)
#CODE_DEF += -DMORE_METALS #Add Carbon and Nitrogen to the list of metals
#CODE_DEF += -DNEED_VPRED #Calculate a predicted veloctiy (this is defined all over, but I'm unsure as to its signifigance)
#CODE_DEF += -DNEWSHEAR #Use the diffusion length for the correlation length in the H2 code from Charlotte Christensen
#CODE_DEF += -DNOCOMPTON #Remove Compton scattering effects from the cooling code (perhaps useful for debugging)
#CODE_DEF += -DNOEXTHEAT #Turn off all external heating effects (UV, Feedback, etc.)
#CODE_DEF += -DNOFIT #Don't use any fitting for the cooling rates without H2 in cooling_metal_noH2.c
#CODE_DEF += -DNOMETALCOOLING #Just use heating from H2, not from metal lines (Requires -DCOOLING_MOLECULARH)
#CODE_DEF += -DNOMOLECULARHCOOLING #Turns COOLING_MOLECULARH into COOLING_METAL
#CODE_DEF += -DNORMAL #Calculate and output surface normals for particles (Needs -DSURFACEAREA)
#CODE_DEF += -DOLD_COMET_FORCE #Enable the do_force for special rubble pile particles (ie comets).
#CODE_DEF += -DOLD_KEPLER #An ugly part of the collision code to prevent hard scatterings that break perturbative assumptions.
#CODE_DEF += -DOLD_VERSION #Change the way the comet force from OLD_COMET_FORCE is calculated
#CODE_DEF += -DPARTSHEAR #Use particle shear for the correlation length in H2 cooling 
#CODE_DEF += -DPDVDEBUG #Output arrays for the PdV from shock and from adiabatic compression. Useful for debugging the hydro.
#CODE_DEF += -DPEAKEDKERNEL #Use a modified Peaked M4 kernel as per Thomas and Couchman 92 (Bibcode:1992MNRAS.257...11T)
#CODE_DEF += -DPEXT #Allow for the use of an external pressure (Sort of the opposite of an external potential.)
#CODE_DEF += -DPRES_HK #Use the Euclidean mean of the both pOverRho values to calculate PdV work
#CODE_DEF += -DPRES_MONAGHAN #Use Monaghan's PdV work calculation (the average of both pOverRho values)
#CODE_DEF += -DRADIATIVEBOX #Estimate Local Lyman-Werner radiation from the tree
#CODE_DEF += -DREDUCED_EWALD #Used reduced Ewald Summation for faster multipole moment expansions
#CODE_DEF += -DRHOSF #Form stars linearly with density above 100 H cc^-3
#CODE_DEF += -DROT_FRAME #Use a rotating reference frame with rotation rate given by dOmega
#CODE_DEF += -DRTDENSITY #Use an alternate method for densities a la. Ritchie & Thomas 2001 (DOI:10.1046/j.1365-8711.2001.04268.x)
#CODE_DEF += -DRTF #-DRTDENSITY and -DRTFORCE (I don't know why we need this extra define)
CODE_DEF += -DRTFORCE #Use an alternate method for forces a la. Ritchie & Thomas 2001 (DOI:10.1046/j.1365-8711.2001.04268.x)
#CODE_DEF += -DRUBBLE_ZML #Use "Rubble Pile" collision model (Requires -DCOLLISION)
#CODE_DEF += -DSAND_PILE #Use the "Sand Pile" collision model (Requires -DCOLLISION)
#CODE_DEF += -DSETTRAPFPE #Enable Floating point exceptions.  VERY USEFUL for debugging.
#CODE_DEF += -DSFCONDITIONS #Use additional conditions for deciding if you form stars (Jeans length vs. h)
#CODE_DEF += -DSHOCKTRACK #Output additional data in order to more easily track shocks (grad rho, div rho*v)
#CODE_DEF += -DSIMPLE_GAS_DRAG #Apply a drag to the gas velocities using either the Epstein regime, or stopping time
#CODE_DEF += -DSIMPLESF #Use an older, simpler starformation recipe (this involves flipping particles from gas -> star)
#CODE_DEF += -DSINKEXTRADATA #Also store the position and velocity of newly formed sink particles.
#CODE_DEF += -DSINKFREEZE #Don't update the positions of sink particles during Drifts.
#CODE_DEF += -DSINKING #Include support for sink particles
#CODE_DEF += -DSINKINGAVERAGE #I believe this prevents sink particles from evolving with time?  (Requires -DSINKING)
#CODE_DEF += -DSINKINGOUTVPRED #Write out the vpred values to the outputted tipsy file for sink particles.
#CODE_DEF += -DSLIDING_PATCH #Alternative collision scheme (I don't really know what this does) (Requires -DCOLLISIONS)
#CODE_DEF += -DSPECIAL_PARTICLES #Include support for weird special particles (not star, gas, or DM)
CODE_DEF += -DSTARFORM #Make new stars according to the starformation recipe
#CODE_DEF += -DSTARSINK #Star particles are also sink partikes.  (Requires -DSINKING)
#CODE_DEF += -DSUPERCOOL #Enable "Supercool" type particles (just gas particles with mean velocities?)
#CODE_DEF += -DSURFACEAREA #Calculate and output the surface area of all the particles.
#CODE_DEF += -DTIMINGDEBUG #Used to debug the timing (walltime I believe).  Probably also handy for benchmarking.
#CODE_DEF += -DTINY_PTHREAD_STACK #Only used on a weird old SGI architecture.  Probably can be removed.
CODE_DEF += -DTOPHATFEEDBACK #Use a tophat kernel to smooth feedback over
#CODE_DEF += -DTUMBLER #Generate a hard-walled cylinder boundary (for use with collisions and sand piles)
#CODE_DEF += -DTWOSMOOTH #Smooth twice rather than 3 times.  This is defined by default in master.c
#CODE_DEF += -DTZKEY64 #Use 64 (instead of 128) bit keys for the tree.  Faster, but allows less depth.
CODE_DEF += -DUNONCOOL #Enable noncooling energy for feedback
#CODE_DEF += -DUNROLLED_VSQRT #Unroll the v_sqrt function for speed
#CODE_DEF += -DUSEHMIN #Use a floor to keep the integrator for stiff equations from blowing up
#CODE_DEF += -DUSE_PNG #Use PNG encoding for dumpframes
#CODE_DEF += -DUSETABLE #Grab the cooling rates from a table
#CODE_DEF += -DVARALPHA #Allow a varying artificial viscosity 
#CODE_DEF += -DVOLUMEFEEDBACK #Smooth FB energy over a volume rather than mass
#CODE_DEF += -DVOXEL #Dump voxels for volume imaging.
CODE_DEF += -DVSIGVISC #Alternate Viscous force calculation (better?)

BASE_DEF = $(PNG_DEF) $(CODE_DEF) $(CC_DEF) $(COOLING_DEF)

MD5 = ` echo $(BASE_DEF) | md5sum | cut -c1-8 `

# The filename of the compiled executable
EXE = gasoline

#
#       NULL defines
#
NULL_MDL		= mdl/null
NULL_CFLAGS		= -g -I$(NULL_MDL) $(BASE_DEF) 
NULL_LD_FLAGS	= $(BASE_LD_FLAGS) -L/usr/lib -L/lib
NULL_XOBJ		= erf.o v_sqrt1.o
NULL_LIBMDL		= $(NULL_MDL)/mdl.o -lm

#
#       DBG defines
#
DBG_MDL		= mdl/null
DBG_CFLAGS		= -g -I$(DBG_MDL) $(BASE_DEF) 
DBG_LD_FLAGS	= $(BASE_LD_FLAGS) -L/usr/lib -L/lib
DBG_XOBJ		= erf.o v_sqrt1.o
DBG_LIBMDL		= $(NULL_MDL)/mdl.o -lm

#
#       SGI defines
#
SGI_MDL			= mdl/mpi
SGI_CFLAGS		= -O2 -I$(SGI_MDL) $(BASE_DEF) -mips4 -64 -r10000
SGI_LD_FLAGS	= -mips4 -64 -r10000 $(BASE_LD_FLAGS)
SGI_XOBJ		=
SGI_LIBMDL		= $(SGI_MDL)/mdl.o -lmpi -lm
SGI_MDL_CFLAGS	= -g2 -O2 -mips4 -64 -r10000

#
#       LINUX AMPI (Charm MPI) defines
#
CHARM=../charm/net-linux/bin/charmc
CHARMLINK=
AMPI_MDL			= mdl/ampi
AMPI_CFLAGS		= -O3 -malign-double -mpentiumpro -I$(AMPI_MDL) $(BASE_DEF) 
AMPI_LD_FLAGS		=  $(BASE_LD_FLAGS)
AMPI_XOBJ                = erf.o v_sqrt1.o
AMPI_LIBMDL              = $(AMPI_MDL)/mdl.o -language ampi $(CHARMLINK) -lm

#
#       LINUX LAM MPI defines
#
LAM_MDL			= mdl/mpi
LAM_CFLAGS		= -fast -I$(LAM_MDL) $(BASE_DEF) -DMPI_LINUX
LAM_LD_FLAGS		=  $(BASE_LD_FLAGS)
LAM_XOBJ                = erf.o v_sqrt1.o
LAM_LIBMDL              = $(LAM_MDL)/mdl.o -lm
LAM_MDL_CFLAGS  = -fast -I$(LAM_MDL) $(BASE_DEF)

#
#       Quadrics MPI defines
#
QMPI_MDL                        = mdl/mpi
QMPI_CFLAGS             = -O3 -I$(QMPI_MDL) $(BASE_DEF) -DMPI_LINUX -DCCC
QMPI_LD_FLAGS           =  $(BASE_LD_FLAGS)
QMPI_XOBJ                = erf.o 
QMPI_LIBMDL              = $(QMPI_MDL)/mdl.o -lmpi -lm
QMPI_MDL_CFLAGS  = -I$(QMPI_MDL) $(BASE_DEF) -DMPI_LINUX 


#       SP1/2 defines
#
SPX_MDL			= mdl/mpi
SPX_CFLAGS		= -O3 -I$(SPX_MDL) $(BASE_DEF)
SPX_LD_FLAGS	= $(BASE_LD_FLAGS)
SPX_XOBJ		= v_sqrt1.o
SPX_LIBMDL		= $(SPX_MDL)/mdl.o -lm
SPX_MDL_CFLAGS	= -g -O3

#
#		PVM defines
#
PVMDIR	= $(PVM_ROOT)
PVMLIB	= $(PVMDIR)/lib/$(PVM_ARCH)/libpvm3.a
BDIR	= $(HOME)/pvm3/bin
XDIR	= $(BDIR)/$(PVM_ARCH)
PVM_MDL		= mdl/pvm
PVM_CFLAGS	= -O3 -I$(PVMDIR)/include -I$(PVM_MDL) $(BASE_DEF)
PVM_XOBJ	= v_sqrt1.o
PVM_LIBMDL	= $(PVM_MDL)/$(PVM_ARCH)/mdl.o $(PVMLIB) $(ARCHLIB) -lm
PVM_LD_FLAGS	= $(BASE_LD_FLAGS)

#
#       PTHREAD defines
#
PTHREAD_MDL			= mdl/pthread
PTHREAD_CFLAGS		= -g -D_REENTRANT -I$(PTHREAD_MDL) $(BASE_DEF)
PTHREAD_LD_FLAGS 	=  $(BASE_LD_FLAGS)
PTHREAD_XOBJ		= erf.o v_sqrt1.o
PTHREAD_LIBMDL 		= $(PTHREAD_MDL)/mdl.o -lm -lpthread

#
#       PTHREAD_SGI defines
#
PTHREAD_SGI_MDL			= mdl/pthread
PTHREAD_SGI_CFLAGS		= -O2 -D_REENTRANT -I$(PTHREAD_SGI_MDL) $(BASE_DEF) -mips4 -64 -r10000
PTHREAD_SGI_LD_FLAGS 	= -mips4 -64 -r10000 $(BASE_LD_FLAGS)
PTHREAD_SGI_XOBJ		= 
PTHREAD_SGI_LIBMDL 		= $(PTHREAD_SGI_MDL)/mdl.o -lm -lpthread
PTHREAD_SGI_MDL_CFLAGS	= -O2 -mips4 -64 -r10000

#
#       T3D MPP defines
#
T3D_MDL	= mdl/mpp
V_SQRT	= ../v_sqrt/lib
V_SQRT1	= ../v_sqrt1/lib
RPC		= ../rpc
T3D_CFLAGS		= -O3 -g -DCRAY_T3D -I$(T3D_MDL) -I$(V_SQRT) -I$(RPC) $(BASE_DEF)
T3D_XOBJ		= hyperlib.o
T3D_LIBMDL		= -O3 -g-L $(V_SQRT) -L $(V_SQRT1) -L $(RPC) \
					$(T3D_MDL)/mdl.o -lv_sqrtc -lv_sqrtc1 -lmpi -lrpc -lm
T3D_LD_FLAGS	= $(BASE_LD_FLAGS)

#
#       T3DMPI MPP defines
#
T3DMPI_MDL	= mdl/t3dmpi
V_SQRT		= ../v_sqrt/lib
V_SQRT1		= ../v_sqrt1/lib
RPC			= ../rpc
T3DMPI_CFLAGS	= -O3 -DCRAY_T3D -I$(T3DMPI_MDL) -I$(V_SQRT) -I$(RPC) $(BASE_DEF)
T3DMPI_XOBJ		= hyperlib.o
T3DMPI_LIBMDL	= -O3 -L $(V_SQRT) -L $(V_SQRT1) -L $(RPC) \
					$(T3DMPI_MDL)/mdl.o -lv_sqrtc -lv_sqrtc1 -lmpi -lrpc -lm
T3DMPI_LD_FLAGS	= $(BASE_LD_FLAGS)

#
#       T3EMPI MPP defines
#
T3EMPI_MDL		= mdl/t3empi
T3EMPI_CFLAGS	= -O3 -DCRAY_T3D -I$(T3EMPI_MDL) -I$(RPC) $(BASE_DEF)
T3EMPI_XOBJ		= hyperlib.o v_sqrt1.t3x.o
T3EMPI_LIBMDL	= $(T3EMPI_MDL)/mdl.o -lmpi -lm
T3DMPI_LD_FLAGS	= $(BASE_LD_FLAGS)

#
#       LINUX Charm  defines
#
CHARM=../charm/net-linux/bin/charmc
CHARMLINK=
CHARM_MDL			= mdl/charm
CHARM_CFLAGS		= -verbose -g -I$(CHARM_MDL) $(BASE_DEF) 
CHARM_MDL_CFLAGS	= -verbose -g -Wall
CHARM_LD_FLAGS		=  $(BASE_LD_FLAGS) -language charm++ -memory os
CHARM_XOBJ                = erf.o v_sqrt1.o
CHARM_LIBMDL              = $(CHARM_MDL)/mdl.o $(CHARMLINK) -lm

#
#       KSR1 defines
#
KSR_MDL			= mdl/ksr
KSR_CFLAGS		= -O2 -w2 -I$(KSR_MDL) $(BASE_DEF)
KSR_LD_FLAGS	= -para $(BASE_LD_FLAGS)
KSR_XOBJ		= erf.o v_sqrt1.ksr.o
KSR_LIBMDL		= $(KSR_MDL)/mdl.o -lm -lrpc

OBJ	= main.o master.o param.o outtype.o pkd.o pst.o grav.o \
	  ewald.o walk.o eccanom.o hypanom.o fdl.o htable.o smooth.o \
	  smoothfcn.o collision.o qqsmooth.o $(COOLING_OBJ) cosmo.o romberg.o \
	  starform.o feedback.o millerscalo.o supernova.o supernovaia.o \
	  startime.o stiff.o runge.o dumpframe.o dffuncs.o dumpvoxel.o rotbar.o special.o ssio.o $(PNG_OBJ) \
	  treezip.o 

EXTRA_OBJ = erf.o hyperlib.o v_sqrt1.o v_sqrt1.ksr.o v_sqrt1.t3x.o


default:	
	@echo "Please tell me what architecture to make."
	@echo "Choices are null, sgi, pvm, pthread, pthread_dec, pthread_sgi, ampi, lam_mpi, qmpi, mpi, spx, t3d, t3dmpi, t3empi, ksr, charm"

install:
	@echo "No installation rules."

clean:
	-rm -f $(OBJ) $(EXTRA_OBJ)

spotless: clean
	@echo rm -rf $(EXE).$(MD5)
	@rm -f $(EXE).$(MD5)
	@rm -f mdl/*/mdl.o

depend:
	makedepend -Y -- $(BASE_DEF) -- *.c

$(XDIR):
	-mkdir $(BDIR)
	-mkdir $(XDIR)

null:
	cd $(NULL_MDL); make "CC=$(CC)" "CFLAGS=$(NULL_CFLAGS)"
	make $(EXE) "CFLAGS=$(NULL_CFLAGS)" "LD_FLAGS=$(NULL_LD_FLAGS)"\
		"MDL=$(NULL_MDL)" "XOBJ=$(NULL_XOBJ)" "LIBMDL=$(NULL_LIBMDL)"
dbg:
	cd $(DBG_MDL); make "CC=$(CC)" "CFLAGS=$(DBG_CFLAGS)"
	make $(EXE) "CFLAGS=$(DBG_CFLAGS)" "LD_FLAGS=$(DBG_LD_FLAGS)"\
		"MDL=$(DBG_MDL)" "XOBJ=$(DBG_XOBJ)" "LIBMDL=$(DBG_LIBMDL)"

sgi:
	cd $(SGI_MDL); make CC=cc "CC_FLAGS=$(SGI_MDL_CFLAGS)"
	make $(EXE) CC=cc "CFLAGS=$(SGI_CFLAGS)" "LD_FLAGS=$(SGI_LD_FLAGS)"\
		"MDL=$(SGI_MDL)" "XOBJ=$(SGI_XOBJ)" "LIBMDL=$(SGI_LIBMDL)"

pvm:
	cd $(PVM_MDL); aimk	
	make $(EXE) "CFLAGS=$(PVM_CFLAGS)" "LD_FLAGS=$(PVM_LD_FLAGS)"\
		"MDL=$(PVM_MDL)" "XOBJ=$(PVM_XOBJ)" "LIBMDL=$(PVM_LIBMDL)"
	mv -f $(EXE) $(XDIR)

pthread:
	cd $(PTHREAD_MDL); make "CC=$(CC)" "CFLAGS=$(PTHREAD_CFLAGS)"
	make $(EXE) "EXE=$(EXE)" "CFLAGS=$(PTHREAD_CFLAGS)" "LD_FLAGS=$(PTHREAD_LD_FLAGS)"\
		"MDL=$(PTHREAD_MDL)" "XOBJ=$(PTHREAD_XOBJ)" "LIBMDL=$(PTHREAD_LIBMDL)"

pthread_dec:
	cd $(PTHREAD_MDL); make CC=ccc
	make $(EXE) CC=ccc "CFLAGS=$(PTHREAD_CFLAGS) -fast -arch ev6" "LD_FLAGS=$(PTHREAD_LD_FLAGS)"\
		"MDL=$(PTHREAD_MDL)" "XOBJ=$(PTHREAD_XOBJ)" "LIBMDL=$(PTHREAD_LIBMDL)"

pthread_sgi:
	cd $(PTHREAD_MDL); make CC=cc "CC_FLAGS=$(PTHREAD_SGI_MDL_CFLAGS)"
	make $(EXE) "CFLAGS=$(PTHREAD_SGI_CFLAGS)" "LD_FLAGS=$(PTHREAD_SGI_LD_FLAGS)"\
		"MDL=$(PTHREAD_SGI_MDL)" "XOBJ=$(PTHREAD_SGI_XOBJ)" "LIBMDL=$(PTHREAD_SGI_LIBMDL)"

ampi:
	cd $(AMPI_MDL); make CC=$(CHARM) "CFLAGS=$(AMPI_MDL_CFLAGS)"
	make $(EXE) CC=$(CHARM) "CFLAGS=$(AMPI_CFLAGS)" "LD_FLAGS=$(AMPI_LD_FLAGS)"\
		"MDL=$(AMPI_MDL)" "XOBJ=$(AMPI_XOBJ)" "LIBMDL=$(AMPI_LIBMDL)"

lam_mpi:
	cd $(LAM_MDL); make CC=mpicc "CC_FLAGS=$(LAM_MDL_CFLAGS)"
	make $(EXE) CC=mpicc "CFLAGS=$(LAM_CFLAGS)" "LD_FLAGS=$(LAM_LD_FLAGS)"\
		"MDL=$(LAM_MDL)" "XOBJ=$(LAM_XOBJ)" "LIBMDL=$(LAM_LIBMDL)"

qmpi:
	cd $(QMPI_MDL); make "CC_FLAGS=$(QMPI_MDL_CFLAGS)"
	make $(EXE) "CFLAGS=$(QMPI_CFLAGS)" "LD_FLAGS=$(QMPI_LD_FLAGS)"\
		"MDL=$(QMPI_MDL)" "XOBJ=$(QMPI_XOBJ)" "LIBMDL=$(QMPI_LIBMDL)"

mpi: spx

spx:
	cd $(SPX_MDL); make CC=mpicc "CC_FLAGS=$(SPX_MDL_CFLAGS)"
	make $(EXE) CC=mpicc "CFLAGS=$(SPX_CFLAGS)" "LD_FLAGS=$(SPX_LD_FLAGS)"\
		"MDL=$(SPX_MDL)" "XOBJ=$(SPX_XOBJ)" "LIBMDL=$(SPX_LIBMDL)"

t3d:
	cd $(T3D_MDL); make
	make $(EXE) "CFLAGS=$(T3D_CFLAGS)" "LD_FLAGS=$(T3D_LD_FLAGS)"\
		"MDL=$(T3D_MDL)" "XOBJ=$(T3D_XOBJ)" "LIBMDL=$(T3D_LIBMDL)"

t3dmpi:
	cd $(T3DMPI_MDL); make
	make $(EXE) "CFLAGS=$(T3DMPI_CFLAGS)" "LD_FLAGS=$(T3DMPI_LD_FLAGS)"\
		"MDL=$(T3DMPI_MDL)" "XOBJ=$(T3DMPI_XOBJ)" "LIBMDL=$(T3DMPI_LIBMDL)"

t3empi:
	cd $(T3EMPI_MDL); make
	make $(EXE) "CFLAGS=$(T3EMPI_CFLAGS)" "LD_FLAGS=$(T3EMPI_LD_FLAGS)"\
		"MDL=$(T3EMPI_MDL)" "XOBJ=$(T3EMPI_XOBJ)" "LIBMDL=$(T3EMPI_LIBMDL)"

ksr:
	cd $(KSR_MDL); make
	make $(EXE) "CFLAGS=$(KSR_CFLAGS)" "LD_FLAGS=$(KSR_LD_FLAGS)"\
		"MDL=$(KSR_MDL)" "XOBJ=$(KSR_XOBJ)" "LIBMDL=$(KSR_LIBMDL)"

charm:
	cd $(CHARM_MDL); make CC=$(CHARM) "CFLAGS=$(CHARM_MDL_CFLAGS)"
	make $(EXE) CC=$(CHARM) "CFLAGS=$(CHARM_CFLAGS)" "LD_FLAGS=$(CHARM_LD_FLAGS)"\
		"MDL=$(CHARM_MDL)" "XOBJ=$(CHARM_XOBJ)" "LIBMDL=$(CHARM_LIBMDL)"

$(EXE): $(OBJ) $(XOBJ)
	echo $(BASE_DEF) >> buildlog.$(MD5)
	$(CC) $(CFLAGS) $(LD_FLAGS) -o $@ $(OBJ) $(XOBJ) $(LIBMDL)
	@mv $(EXE) $(EXE).$(MD5)

$(OBJ) $(EXTRA_OBJ): Makefile

# DO NOT DELETE

cosmo.o: runge.h cosmo.h
ewald.o: ewald.h pkd.h floattype.h cooling.h meval.h qeval.h
fdl.o: htable.h fdl.h
grav.o: pkd.h floattype.h cooling.h grav.h meval.h qeval.h
htable.o: htable.h
integration.o: linalg.h floattype.h integration.h
linalg.o: linalg.h floattype.h
main.o: master.h param.h pst.h pkd.h floattype.h cooling.h smoothfcn.h
main.o: parameters.h cosmo.h outtype.h
master.o: master.h param.h pst.h pkd.h floattype.h cooling.h smoothfcn.h
master.o: parameters.h cosmo.h tipsydefs.h opentype.h fdl.h htable.h
master.o: outtype.h
millerscalo.o: millerscalo.h
outtype.o: pkd.h floattype.h cooling.h outtype.h
param.o: param.h
pkd.o: pkd.h floattype.h cooling.h ewald.h grav.h walk.h opentype.h
pkd.o: tipsydefs.h dumpframe.h
pst.o: pst.h pkd.h floattype.h cooling.h smoothfcn.h starform.h feedback.h
pst.o: outtype.h smooth.h dumpframe.h
romberg.o: floattype.h
smooth.o: smooth.h pkd.h floattype.h cooling.h smoothfcn.h
smoothfcn.o: smoothfcn.h pkd.h floattype.h cooling.h
startime.o: floattype.h startime.h
supernova.o: pkd.h floattype.h cooling.h feedback.h supernova.h startime.h
supernova.o: millerscalo.h supernovaia.h
supernovaia.o: supernova.h startime.h millerscalo.h feedback.h pkd.h
supernovaia.o: floattype.h cooling.h supernovaia.h
dumpframe.o: dumpframe.c dumpframe.h
dumpvoxel.o: dumpvoxel.c dumpframe.h dumpvoxel.h
dffuncs.o: dffuncs.c dumpframe.h
treezip.o: treezip.c treezip.h treezipkey.h treeziptypes.h
writepng.o: writepng.c writepng.h
walk.o: walk.h pkd.h floattype.h cooling.h
rotbar.o: 
