# Nextflow workflow for generating pseudo-DDA mzXML files from DIA ones via DIAUmpire

## Usage

The workflow takes the following parameters:
*  --help:           show this message and exit
*  --dia_folder:     folder with DIA mzXML files to be parsed (default: Data/DIA)
*  --diau_se_params: DIA-Umpire_SE parameter file (default: Params/diaumpire_se.params)

Example usage:

```bash
nextflow run digitalproteomes/NF-DIAUmpire
```
At the end of the workflow the prepared pseudo-DDA files (3 per DIA file) will be found in the *Results/DIAUmpire* folder.