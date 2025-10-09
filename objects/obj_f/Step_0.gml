if (instance_exists(owner)) {
    x = owner.x;
    y = owner.y - 20;
} else {
    instance_destroy();
}