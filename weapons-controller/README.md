# Weapons Controller Plugin for Godot

## Overview

This plugin provides an easy way to manage and control 2D character weapons in Godot. It automatically toggles weapon visibility based on the player's equipped weapons, supporting dynamic weapon management for character nodes. Ideal for games needing flexible weapon systems.

## Features

- Automatically shows/hides weapon nodes based on the player's equipped weapons
- Simple integration with your character scenes
- Easily customizable for different weapon systems

## Installation

1. Copy the `weapons-controller` folder into your Godot project's `addons` directory.
2. Enable the plugin in your project settings under `Project > Project Settings > Plugins`.

## Usage

1. Attach the `weapons-controller.gd` script to a `Node2D` in your character scene.
2. Set the `weapons_node_path` export variable to the node containing your weapon nodes (e.g., a `Node2D` with weapon children).
3. Ensure your `Player` singleton or autoload has a `weapons` array containing the names of currently equipped weapons.

### Example

Suppose you have a character scene with a `Node2D` named `Weapons` containing weapon nodes as children:

- Player
  - Weapons
    - Sword
    - Bow
    - Staff

Set `weapons_node_path` to `"Weapons"`. The plugin will automatically show/hide these weapon nodes based on the contents of `Player.weapons`.

## Author

itsjinhk

## License

MIT (or specify your license here)
