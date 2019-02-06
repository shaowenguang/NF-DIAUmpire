if(params.help) {
    log.info ""
    log.info "DIA-Umpire workflow"
    log.info "--------------------"
    log.info ""
    log.info "Generates pseudo-DDA mzXML files from DIA MS runs via DIA-Umpire."
    log.info ""
    log.info "Options:"
    log.info "  --help:           show this message and exit"
    log.info "  --dia_folder:     folder with DIA mzXML files to be parsed (default: $params.dia_folder)"
    log.info "  --diau_se_params: DIA-Umpire_SE parameter file (default: $params.diau_se_params)"
    log.info ""
    log.info "Results will be stored in Results/DIAUmpire"
    log.info ""
    exit 1
}

process diaUmpire {
    input:
    file dia_file from file("${params.dia_folder}/*.mzXML")
    file diau_se_params from file(params.diau_se_params)

    output:
    file '*.mgf' into diaUmpireOut
    
    """
    dia_umpire_se $dia_file $diau_se_params
    """
}

process mgf2mzxml {
    publishDir 'Results/DIAUmpire'

    input:
    // For each DIA file DIA-Umpire will generate 3 pseudo mgf files
    file mgf_file from diaUmpireOut.flatten()

    output:
    file '*.mzXML'
    
    """
    msconvert $mgf_file --mzXML
    """
}
