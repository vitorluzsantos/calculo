# convenio fique em paz 
set.seed(123)

# pessoas conveniadas em são paulo
conveniados_sp <- 189000 * 0.34
conveniados_sp

# os conveniados de são paulo afetados pela onda de calor
conveniados_afetados <- conveniados_sp * 0.32
conveniados_afetados

# pessoas de são paulo afetadas na faixa de idade dos (7 a 17 anos) e (55 a 82 anos)
faixa_idade <- conveniados_afetados * 0.38
faixa_idade

# da faixa de idade analisada, 61,5% são jovens e os 38.5% são idosos
porcentagem_jovens <- 61.5
porcentagem_idosos <- 38.5
