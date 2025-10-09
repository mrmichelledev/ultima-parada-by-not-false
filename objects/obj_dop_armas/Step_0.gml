speed = lerp(speed, 0, .1)

if (point_distance(x, y, obj_player.x, obj_player.y) < 50) {
    // Cria apenas uma vez
    if (!instance_exists(obj_f)) {
        balao = instance_create_layer(x, y - 20, "Armas", obj_f);
        balao.owner = id; // opcional: para seguir o inimigo
    }
} else {
    // Destroi apenas quando o jogador sai da área
    if (instance_exists(balao)) {
        instance_destroy(balao);
        balao = noone;
    }
}
