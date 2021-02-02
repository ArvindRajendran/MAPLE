                                             
					                                   ███╗   ███╗ █████╗ ██████╗ ██╗     ███████╗
                                             ████╗ ████║██╔══██╗██╔══██╗██║     ██╔════╝
                                             ██╔████╔██║███████║██████╔╝██║     █████╗  
                                             ██║╚██╔╝██║██╔══██║██╔═══╝ ██║     ██╔══╝  
                                             ██║ ╚═╝ ██║██║  ██║██║     ███████╗███████╗
                                             ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝╚══════╝
                                           
				      Machine-assisted Adsorption Process Learner and Emulator
                                   
	
					        Copyright (C) 2021 Arvind Rajendran
						   University of Alberta, Canada

					    Laboratory of Advanced Separation Processes
						     Prof. Dr. Arvind Rajendran
							Project: 
					    Readme last updated: 02th February 2021, KNP

## INTRODUCTION
The function MAPLE simulates the Machine-assisted Adsorption Process Learner and Emulator proposed in *Generalized, Adsorbent-Agnostic, Artificial Neural Network Framework for Rapid Simulation, Optimization, and Adsorbent Screening of Adsorption Processes, doi*(https://doi.org/10.1021/acs.iecr.0c02339).
This code simulates a two component system using the LPP cycle with the MAPLE model. Component A is the component of interest (CO2 in the original article).

## FILE LIST
1. `MAPLE.m` : Main wrapper function 
2. `MAPLE4stepwithFPModels.mat` : Loads 4 step with FP cycle neural network models at net object file. Contains net1,net2,net3,net4, mue, sig.
3. `MAPLE4stepwithLPPModels.mat` : Loads 4 step with LPP cycle neural network models at net object file. Contains net1,net2,net3,net4, mue, sig.

## INSTALLATION

### Dependencies

The following dependencies are required for the proper execution of this program.

1. MATLAB version 2019b onwards *[required]*


### Installation instructions

1. Clone the full software package from the GitHub server into the preferred installation directory (e.g. Desktop, My Documents). The command is as follows:
```sh
git clone https://github.com/ArvindRajendran/MAPLE.git

```
This step would require installation of Git (https://git-scm.com/downloads).
2. The user can load cycle model object files from `MAPLE4stepwithFPModels.mat` or `MAPLE4stepwithLPPModels.mat` file.
3. After filling out the necessary information in the `MAPLE.m` file, run `MAPLE.m`.

## HOW TO USE THE SOFTWARE?
The `MAPLE` file consists multiple options. A brief description of each of these options is listed below.

### INPUT: SIMULATION INFO


* `Qsat`: Saturation capacity of adsorbent [mol/m3]. Ref. to Eq. 1 (qsat) in the original article. Varies from [800 10000][mol/m3] 
* `log10(bCO2)`: log base 10 of Adsorption coeffecient of component A [m3/mol]. Ref. to Eq. 2 (bi) in the original article. Varies from [-5 1] [m3/mol]  
* `log10(bCO2)`: log base 10 of Adsorption coeffecient of component B [m3/mol]. Ref. to Eq. 2 (bi) in the original article. Varies from [-7 0] [m3/mol] 
* `DelUCO2`: -Internal energy of component A [kJ/mol]. Ref. to Eq. 2 (Ui) in the original article. Varies from [7 47] [kJ/mol]
* `DelUN2`: -Internal energy of component B [kJ/mol]. Ref. to Eq. 2 (Ui) in the original article. Varies from [7 47] [kJ/mol]
* `Density`: Particle/Pellet Density [kg/m3]. Ref. to Eq. S3 (\rho_s) in the SI of the original article. Varies from [800 1200] [kg/m3]
* `yFeed`: Feed Composition of CO2 [-]. Ref. in the original article in process cycle. Varies from [0.05 0.45] [-]
* `tADS`: Adsorption Step time [s]. Ref. in the original article in process cycle. Varies from [10 110] [s]
* `PH`: High pressure [bar]. Ref. in the original article in process cycle. Varies from [1 5] [bar]
* `PI`: Intermediate pressure [bar]. Ref. in the original article in process cycle. Varies from [0.07 4] [bar]
* `PL`: Low pressure [bar]. Ref. in the original article in process cycle. Varies from [0.01 1] [bar]
* `Vfeed`: Feed velocity [m/s]. Ref. in the original article in process cycle. Varies from [0.1 1.5] [m/s]

% Inputs to code is in this order:
  N=[Qsat [mol/m3] [800 10000] log10bCO2 [m3/mol] [-5 1] log10bN2 [m3/mol] [-7 0] DelUCO2 [kJ/mol] [7 47] DelUN2 [kJ/mol] [3 25]...
  Density [kg/m3] [800  1200] yfeed [-] [0.05 0.5] tADS [s] [10 110] PH [bar] [1-5] PI [bar] [0.07 4] PL [bar] [0.01 0.99] Vfeed [m/s] [0.1 1.5] ];

### OUTPUT:

purity: CO2 Purity [%]. Ref. in the original article in 'Separation System and Performance Metrics' section. (net2)
recovery: CO2 Recovery [%].  Ref. in the original article in 'Separation System and Performance Metrics' section. (net1)
Productivity: Process Productivity [mol CO2/m3 adsorbent s]. Ref. in the original article in 'Separation System and Performance Metrics' section.(net4)
Energy: Energy consumption [kWhe/tonne CO2 cap].  Ref. in the original article in 'Separation System and Performance Metrics' section.(net3) 

## ADDITIONAL COMMENTS
* In case, the user is unsure of simulation settings, default values would be imposed on the simulation.
  These default values are the same as the ones used in the original manuscript.
  The only requirement in such a case is to load cycle models as a neural network (net) object from a file.
* Two cycle model object files are provided to the user of the software.
  MAPLE4stepwithFPModels.mat file and MAPLE4stepwithLPPModels.mat file is provided.

* This model is written in a general fashion for a two component system using the 4 step VSA cycle with FP and 4 step VSA cycle with LPP, but has been tested extensively only for the CO2/N2 system.

## REFERENCES
 
Generalized, Adsorbent-Agnostic, Artificial Neural Network Framework for Rapid Simulation, Optimization, and Adsorbent Screening of Adsorption Processes
Kasturi Nagesh Pai and Vinay Prasad and Arvind Rajendran
<Citation>@article{pai2020generalized,
  title={Generalized, Adsorbent-Agnostic, Artificial Neural Network Framework for Rapid Simulation, Optimization, and Adsorbent Screening of Adsorption Processes},
  author={Pai, Kasturi Nagesh and Prasad, Vinay and Rajendran, Arvind},
  journal={Industrial \& Engineering Chemistry Research},
  volume={59},
  number={38},
  pages={16730--16740},
  year={2020},
  publisher={ACS Publications}
}
<DOI>https://doi.org/10.1021/acs.iecr.0c02339

Practically Achievable Process Performance Limits for Pressure-Vacuum Swing Adsorption Based Post-Combustion CO2 Capture
Kasturi Nagesh Pai and Vinay Prasad and Arvind Rajendran
@article{pai2020practically,
  title={Practically achievable process performance limits for pressure-vacuum swing adsorption based post-combustion CO2 capture},
  author={Pai, Kasturi Nagesh and Prasad, Vinay and Rajendran, Arvind},
  year={2020},
  publisher={ChemRxiv}
}
<DOI>

Experimentally validated machine learning frameworks for accelerated prediction of cyclic steady state and optimization of pressure swing adsorption processes
<Citation>@article{pai2020experimentally,
  title={Experimentally validated machine learning frameworks for accelerated prediction of cyclic steady state and optimization of pressure swing adsorption processes},
  author={Pai, Kasturi Nagesh and Prasad, Vinay and Rajendran, Arvind},
  journal={Separation and Purification Technology},
  volume={241},
  pages={116651},
  year={2020},
  publisher={Elsevier}
}
<DOI>https://doi.org/10.1016/j.seppur.2020.116651

## AUTHORS

### Maintainers of the repository
* Kasturi Nagesh Pai (kasturin@ualberta.ca)

### Project contributors
* Prof. Dr. Arvind Rajendran (arvind.rajendran@ualberta.ca)
* Prof. Dr. Vinay Prasad (vprasad@ualberta.ca)


## LICENSE
Copyright (C) 2021 Arvind Rajendran

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
