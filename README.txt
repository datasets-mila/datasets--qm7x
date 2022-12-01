====================

   QM7-X DATASET

====================

A description of the structure generation procedure is available in the paper related to this dataset.

Each HDF5 file contains information about the molecular properties of equilibrium and non-equilibrium conformations of small molecules composed of up to seven heavy atoms (C, N, O, S, Cl). For instance, you can access to the information saved in the 1000.hdf5 file as,

fDFT = h5py.File('1000.hdf5', 'r')

fDFT[idmol]: idmol, ID number of molecule (e.g., '1', '100', '94')

fDFT[idmol][idconf]: idconf, ID configuration (e.g., 'Geom-m1-i1-c1-opt', 'Geom-m1-i1-c1-50')

The idconf label has the general form "Geom-mr-is-ct-u", were r enumerated the SMILES strings, s the stereoisomers excluding conformers, t the considered (meta)stable conformers, and u the optimized/displaced structures; u = opt indicates the DFTB3+MBD optimized structures and u = 1,...,100 enumerates the displaced non-equilibrium structures. Note that these indices are not sorted according to their PBE0+MBD relative energies.

Then, for each structure (i.e., idconf), you will find the following properties:

-'atNUM': Atomic numbers (N)
-'atXYZ': Atoms coordinates [Ang] (Nx3)
-'sRMSD': RMSD to optimized structure [Ang] (1)
-'sMIT': Momente of inertia tensor [amu.Ang^2] (9)

-'ePBE0+MBD': Total PBE0+MBD energy [eV] (1)
-'eDFTB+MBD': Total DFTB+MBD energy [eV] (1)
-'eAT': PBE0 atomization energy [eV] (1)
-'ePBE0': PBE0 energy [eV] (1)
-'eMBD': MBD energy [eV] (1)
-'eTS': TS dispersion energy [eV] (1)
-'eNN': Nuclear-nuclear repulsion energy [eV] (1)
-'eKIN': Kinetic energy [eV] (1)
-'eNE': Nuclear-electron attracttion [eV] (1)
-'eEE': Classical coulomb energy (el-el) [eV] (1)
-'eXC': Exchange-correlation energy [eV] (1)
-'eX': Exchange energy [eV] (1)
-'eC': Correlation energy [eV] (1)
-'eXX': Exact exchange energy [eV] (1)
-'eKSE': Sum of Kohn-Sham eigenvalues [eV] (1)
-'KSE': Kohn-Sham eigenvalues [eV] (depends on the molecule)
-'eH': HOMO energy [eV] (1)
-'eL': LUMO energy [eV] (1)
-'HLgap': HOMO-LUMO gap [eV] (1)
-'DIP': Total dipole moment [e.Ang] (1)
-'vDIP': Dipole moment components [e.Ang] (3)
-'vTQ': Total quadrupole moment components [e.Ang^2] (3)
-'vIQ': Ionic quadrupole moment components [e.Ang^2] (3)
-'vEQ': Electronic quadrupole moment components [eAng^2] (3)
-'mC6': Molecular C6 coefficient [hartree.bohr^6] (computed using SCS) (1)
-'mPOL': Molecular polarizability [bohr^3] (computed using SCS) (1)
-'mTPOL': Molecular polarizability tensor [bohr^3] (9)

-'totFOR': Total PBE0+MBD atomic forces (unitary forces cleaned) [eV/Ang] (Nx3)
-'vdwFOR': MBD atomic forces [eV/Ang] (Nx3)
-'pbe0FOR': PBE0 atomic forces [eV/Ang] (Nx3)
-'hVOL': Hirshfeld volumes [bohr^3] (N)
-'hRAT': Hirshfeld ratios (N)
-'hCHG': Hirshfeld charges [e] (N)
-'hDIP': Hirshfeld dipole moments [e.bohr] (N)
-'hVDIP': Components of Hirshfeld dipole moments [e.bohr] (Nx3)
-'atC6': Atomic C6 coefficients [hartree.bohr^6] (N)
-'atPOL': Atomic polarizabilities [bohr^3] (N)
-'vdwR': van der Waals radii [bohr] (N)

++++++++++++++++++++++++++++++++++++++
Creating a single database (DB) file
++++++++++++++++++++++++++++++++++++++

Use the python script createDB.py to create a single DB file containing the information stored in QM7-X dataset. This script reads all the HDF5 files and, then, produces the DB file named QM7X.db containing atomic position, atomic number, and the required physicochemical properties (e.g., 'EPBE0', 'eAT', 'forces', 'mPOL', 'DIIP'). To run the script, you will need to install the following packages: numpy, h5py, ase, and schnetpack. Quick installation can be done by using PIP (e.g., pip install numpy). As a tip, we recommend to download the file 8000.xz to run the script and to understand how it works.

REMARK: As it was mentioned in the paper related to this dataset, there are some duplicated equilibrium structures in the HDF5 files (see DupMols.dat). For this reason, we have written a function in the python script to exclude these molecules together with their corresponding non-equilibrium structures. This function can be enabled by uncommenting the line 55. Since the non-equilibrium structures corresponding to these duplicated molecules are not identical, we let the user to decide whether using this information or not. 


