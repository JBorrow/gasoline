// Gasoline uses a number of defines to enable/disable code features,
// debug sections of the code, and switch out different physics.
// Below is a complete list of the available user defines for gasoline.
// Most of them will NEVER be useful to you, as gasoline includes a lot of
// very case-specific code. If you don't know what a define means, you probably
// don't need it. The uncommented ones that come in the repository are probably fine.
// Simply uncomment a line to enable that define, or comment it to disable it.

//#define ACCZERO               //Lock the positions of the particles (useful for debugging)
//#define AGGS                  //Include support for aggregates (like asteroids and rubble piles) See aggs.c
//#define AGGSCLEANUP           //Comments suggest this define includes incomplete code.
//#define ALPHACMUL=0.1         //The AV coeffcient multiplier
//#define ALPHAMIN=0.01         //The minimum AV coefficent
//#define ASSERTENEG            //A useful debugging option for ensuring that the energy generated by cooling is positive
//#define BENCHMARK             //This is self-explanatory. Not good for actual simulations.
//#define CCC                   //Turn off stdout buffering
#define CHABRIER                //Use the Chabrier 2003 IMF for starformation (See DOI:10.1086/376392)
#define CHANGESOFT              //Allow you to explicitly give the softening length for gravity
//#define CHECKSF               //Add additional outputs to check on star formation
//#define CHECKSOFT             //A pile of debugging for the gravitational softening
//#define CLOUDY                //Use CLOUDY version of line cooling
//#define COLLISIONS            //Include solid-body collisions
//#define COLORCODE             //Color the particles and keep track of them (movie making?)
//#define COLUMNLENGTH          //Use the smoothing length for the correlation length in Charlotte Christensen's H2 code
//#define COMPLETE_LOCAL        //Use complete (rather than partial) multipole expansion
//#define CONTROLYHII           //Make sure error in YHII and YHeIII is controlled
//#define COOLING_METAL_BROKEN  //Debug lines for outputting some extra data for debugging cooling_metal
//#define COOLDEBUG             //Output debugging information from the gas cooling
//#define CUBICTABLEINTERP      //Use a higher order interpolation for the cooling table
//#define DEBUG                 //Various extra prints etc.
//#define DEBUG2                //Extra outputs to check treezip is working
//#define DEBUGTRACK            //Extra debugging checks for dumpframe
//#define DELTAACCELACTIVE      //Check that only active particles are used for updating a particles timestep
//#define DELTACCELCAP          //Make sure that a particles neighbours have a say in it's timestep.
#define DENSITYU                //Use the modified energy-weighted density of a particle (good for large density gradients)
//#define DENSITYUOLD           //DEPRECATED
#define DENSITYUNOTP            //More aggressive version of the energy-weighted density that ignores contribution from center
//#define DENSSOFT              //Use the SPH density for gravity softening
//#define DEPTHCHECK            //Debug how deep the tree goes during treebuilds
#define DIFFUSION               //Enable Metal Diffusion
#define DIFFUSIONHARMONIC       //Use the harmonic sum for calculating thermal diffusion
//#define DIFFUSIONPRICE        //Daniel Price's Thermal Diffusion
//#define DIFFUSIONTHERMAL      //Thermal Diffusion (DEPRECATED)
//#define DIVVOFF               //Remove the convergent flow requirement for starformation
//#define DIVVCORRBAD           //Better corrector on average but pathological with very uneven particle distributions
//#define DKDENSITY             //Calculate the density using the derivative of the kernel in the DVDX calculation of density
#define DODVDS                  //Better handling of viscosity with the Balsara switch
//#define DRHODT                //Use the change in density over time (dRho/dt) as a timestep criteria
//#define DRHODTDIVOUT          //Output Divv variables used in DRHODT
//#define DRHODTTEST            //Output a large list of properties important for the DRHODT parts of the code for debugging
#define DTADJUST                //Use a more clever "anticipatory" timestep criteria for multistepping
//#define DTTEST=?              //Print debug info for particles with dt values below this
#define EPSACCH                 //Turning this one makes the pkd code ignore dhMinOverSoft in pkdAccelStep
//#define FEEDBACKDIFFLIMIT     //Disable thermal diffusion for particles that have their cooling shut off
//#define FITDVDX               //Use a fitted version of the DenDVDX that doesn't use the stiff.h evaluator.
//#define FBPARTICLE            //Use particle creation for feedback (*Very kludgey currently*)
#define PARTICLESPLIT           //Particles will now shatter if they get too heavy
#define PROMOTE                 //Make particles hot based on conduction in feedback
#define GASOLINE                //Do SPH (without this, compiles pkdgrav, just N-Body)
//#define GLASS                 //Use this to make glass initial conditions
//#define GLASSZ                //Use this to make an IC that has a glassy distribution in the z-axis
//#define GR_DRAG               //Enable Frame draggin (I believe)
//#define GSS_DUMPFRAME         //Dumpframe that allows coloring by particle property
//#define GRADW                 //Testing code to see how well Grad 1 = 0 output in .curl
//#define GRADWONESIDED         //Only use the primary particle for calculating the kernel gradient (one-sided)
//#define GROWMASS              //Allow collisional particles to grow
//#define HSHRINK               //M4 kernel times (pi/6)^(1/3) for a tighter kernel
//#define INELASTICCOLLAPSE     //Use the experimental inellastic collaspse strategy for collisions
//#define INFLOWOUTFLOW         //Enable inflow/outflow boundary conditions
//#define JEANSSF               //Use a simple Jeans length criteria for starformation
#define JEANSSOFT               //Force the smoothing & softening length to be at least as small as the Jeans scale
//#define JEANSSOFTONLY         //Only force the softening length to be as small as the Jeans scale
//#define KROUPA                //Use the Kroupa IMF (from Kroupa et al 1993 Bibcode:1993MNRAS.262..545K)
//#define KROUPA01              //Use the newer Kroupa 01 IMF (DOI:10.1046/j.1365-8711.2001.04022.x)
//#define LONGRANGESTEP         //Predict what particles will need to be put onto a longer timestep. (DEPRECATED)
//#define M43D                  //Use a fancier 3D derived M4 Kernel
//#define MASSDIFF              //Enable Mass diffusion (probably not a good idea right now)
//#define MODBATEPOLY           //Use a polytropic equation of state with COOLING_BATE
//#define MOLECFRAC_SF_CUTOFF   //Add a molecular hydrogen threshold for starformation (10% H2)
//#define MS_TST                //Print out testing data for the Miller-Scalo IMF
//#define NEED_VPRED            //Calculate a predicted veloctiy (this is defined all over, I'm unsure as to its signifigance)
//#define NEWSHEAR              //Use the diffusion length for the correlation length in the H2 code from Charlotte Christensen
//#define NOCOMPTON             //Remove Compton scattering effects from the cooling code (perhaps useful for debugging)
//#define NODIFFUSIONTHERMAL    //Disable all thermal diffusion
//#define NOEXTHEAT             //Turn off all external heating effects (UV, Feedback, etc.)
//#define NOFIT                 //Don't use any fitting for the cooling rates without H2 in cooling_metal_noH2.c
//#define NOMETALCOOLING        //Just use heating from H2, not from metal lines (Requires -DCOOLING_MOLECULARH)
//#define NOMOLECULARHCOOLING   //Turns COOLING_MOLECULARH into COOLING_METAL
//#define NORMAL                //Calculate and output surface normals for particles (Needs -DSURFACEAREA)
#define NSMOOTHINNER          //Ensure at least 18 neighbours inside 1.41 h
//#define OLDINITSPHCODE        //Use the older multi-resmooth msrInitSph (deprecated?)
//#define OLD_COMET_FORCE       //Enable the do_force for special rubble pile particles (ie comets).
//#define OLD_COMET_STUFF       //Initialize special particles (this is a huge kludge)
//#define OLD_KEPLER            //An ugly part of the collision code to stop hard scatterings 
//#define OLD_VERSION           //Change the way the comet force from OLD_COMET_FORCE is calculated
//#define PARTSHEAR             //Use particle shear for the correlation length in H2 cooling 
//#define PCONST=?              //Use a constant pressure specified for all gas
//#define PEAKEDKERNEL          //Use a modified Peaked M4 kernel as per Thomas and Couchman 92 (Bibcode:1992MNRAS.257...11T)
//#define PEXT                  //Allow for the use of an external pressure (Sort of the opposite of an external potential.)
//#define PREDRHO               //Generate predicted rho values (if bPredRho == 2)
//#define PRES_HK               //Use the Euclidean mean of the both pOverRho values to calculate PdV work
//#define PRES_MONAGHAN         //Use Monaghan's PdV work calculation (the average of both pOverRho values)
//#define PONRHOFLOOR=1e-30     //Minimum P/rho value, prevents floating point errors in some cases
//#define QUINTIC               //Use a quintic spline kernel from Dehnen & Aly 2012 (Bibcode:2012MNRAS.425.1068D)
//#define RANOLD                //Use an older random number generator for debugging the rubble code
//#define RADIATIVEBOX          //Estimate Local Lyman-Werner radiation from the tree
//#define REDUCED_EWALD         //Used reduced Ewald Summation for faster multipole moment expansions
//#define RHOSF                 //Form stars linearly with density above 100 H cc^-3
//#define ROT_FRAME             //Use a rotating reference frame with rotation rate given by dOmega
//#define RTDENSITY             //Use an Ritchie & Thomas densities (DOI:10.1046/j.1365-8711.2001.04268.x)
//#define RTF                   //-DRTDENSITY and -DRTFORCE (I don't know why we need this extra define)
#define RTFORCE                 //Use an Ritchie & Thomas forces (DOI:10.1046/j.1365-8711.2001.04268.x)
//#define RUBBLE_ZML            //Use "Rubble Pile" collision model (Requires -DCOLLISION)
//#define SAND_PILE             //Use the "Sand Pile" collision model (Requires -DCOLLISION)
//#define SETTRAPFPE            //Enable Floating point exceptions. VERY USEFUL for debugging.
//#define SFBOUND               //Use a surface-density criteria for allowing star formation.
//#define SFCONDITIONS          //Use additional conditions for deciding if you form stars (Jeans length vs. h)
//#define SHOCKTRACK            //Output additional data in order to more easily track shocks (grad rho, div rho*v)
//#define SIMPLE_GAS_DRAG       //Apply a drag to the gas velocities using either the Epstein regime, or stopping time
//#define SIMPLESF              //Use an older, simpler starformation recipe (this involves flipping particles from gas -> star)
//#define SINKEXTRADATA         //Also store the position and velocity of newly formed sink particles.
//#define SINKFREEZE            //Don't update the positions of sink particles during Drifts.
//#define SINKING               //Include support for sink particles
//#define SINKINGAVERAGE        //I believe this prevents sink particles from evolving with time? (Requires -DSINKING)
//#define SINKINGOUTVPRED       //Write out the vpred values to the outputted tipsy file for sink particles.
//#define SLIDING_PATCH         //Alternative collision scheme (I don't really know what this does) (Requires -DCOLLISIONS)
//#define SNIA_TST              //Print out SN Ia feedback properties
//#define SPECIAL_PARTICLES     //Include support for weird special particles (not star, gas, or DM)
//#define SPH1D                 //Only allow forces in the x-direction
//#define SPINUP                //Use alternative rotating frame, just apply accelerations.
//#define STARCLUSTERFORM       //Make new stars using the clustered star formation recipe
#define STARFORM                //Make new stars according to the starformation recipe
//#define STARSINK              //Star particles are also sink partikes. (Requires -DSINKING)
//#define SUPERCOOL             //Enable "Supercool" type particles (just gas particles with mean velocities?)
//#define SURFACEAREA           //Calculate and output the surface area of all the particles.
#define THERMALCOND             //Enable Thermal conduction using the Spitzer Solution
//#define TIMINGDEBUG           //Used to debug the timing (walltime I believe). Probably also handy for benchmarking.
//#define TINY_PTHREAD_STACK    //Only used on a weird old SGI architecture. Probably can be removed.
//#define TOPHATFEEDBACK        //Use a tophat kernel to smooth feedback over
//#define TUMBLER               //Generate a hard-walled cylinder boundary (for use with collisions and sand piles)
#define TWOPHASE                //Use multiphase particles for feedback
//#define TWOPHASEINIT          //Put half the initial particle mass into noncooling mass. Useful for debugging.
//#define TWOSMOOTH             //Smooth twice rather than 3 times. This is defined by default in master.c
//#define TZKEY64               //Use 64 (instead of 128) bit keys for the tree. Faster, but allows less depth.
//#define UNONCOOL              //Enable noncooling energy for feedback
//#define UNONCOOLINIT          //Initialize the uHot to have equal energy to u (useful for hacking some tests)
//#define UNONCOOLMERGE         //Put the uHot energy from a checkpoint into u (for debugging)
//#define UNROLLED_VSQRT        //Unroll the v_sqrt function for speed
//#define USEHMIN               //Use a floor to keep the integrator for stiff equations from blowing up
//#define USE_PNG               //Use PNG encoding for dumpframes
//#define USETABLE              //Grab the cooling rates from a table
//#define VARALPHA              //Allow a varying artificial viscosity 
//#define VOLUMEFEEDBACK        //Smooth FB energy over a volume rather than mass
//#define VOXEL                 //Dump voxels for volume imaging.
#define VSIGVISC                //Alternate Viscous force calculation (better?)
//#define WENDLAND              //Use the Wendland C_2 Kernel (See Dehnen & Aly 2012)
#define WENDLANDC4              //Use the Wendland C_4 Kernel (See Dehnen & Aly 2012)
//#define WOLFIRE               //Use the Wolfire values for the metal cooling rate with UV heating
//#define WOLFIRE_NOTWOPHASE    //Use an imposed cooling rate without a two-phase instability