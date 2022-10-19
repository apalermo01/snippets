import yaml
import os

def update_cfg(old_cfg, new_cfg):
    for key in new_cfg:

        # recursive step if this is a sub-dictionary
        if isinstance(new_cfg[key], dict):

            # adding a new key if the sub-dictionary is not in the original cfg
            if key not in old_cfg:
                old_cfg[key] = {}
            old_cfg[key] = update_cfg(old_cfg[key], new_cfg[key])

        # otherwise just replace or add a new key
        else:
            old_cfg[key] = new_cfg[key]
    return old_cfg


def load_cfg(path):

    # load original cfg
    with open(path, 'r') as f:
        cfg = yaml.safe_load(f)

    # check if this cfg inherits from anything
    if 'base_cfg' in cfg:

        # if it does, load that cfg (recursive step)
        base_cfg = load_cfg(os.path.join(os.path.split(path)[0], cfg['base_cfg']))
        _ = cfg.pop('base_cfg')

        # reconcile differences in cfg based on base_cfg
        base_cfg = update_cfg(base_cfg, cfg)
        return base_cfg

    else:
        return cfg
