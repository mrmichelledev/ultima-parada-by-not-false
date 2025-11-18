if (instance_number(object_index) > 1)
{
    // Se houver mais de uma, destrói esta nova instância duplicada
    instance_destroy();
    exit; // Impede que o restante do código seja executado (evitando a redefinição)
}

// O código abaixo só será executado pela PRIMEIRA (e única) instância

// 2. Inicialização do Volume
global.volume_master = 1.0; 

// 3. Aplica o volume
audio_set_master_gain(0, global.volume_master);

array_depth = []

