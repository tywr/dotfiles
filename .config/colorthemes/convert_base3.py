import argparse
import yaml
from jinja2 import Environment, FileSystemLoader
import os


def hex_to_rgb(hex_str: str) -> tuple[int, int, int]:
    """Converts a hex color string to an RGB tuple."""
    hex_str = hex_str.lstrip("#")
    if len(hex_str) != 6:
        raise ValueError("Hex color string must be 6 characters long (e.g., 'RRGGBB').")
    return tuple(int(hex_str[i : i + 2], 16) for i in (0, 2, 4))


def rgb_to_hex(rgb_tuple: tuple[int, int, int]) -> str:
    """Converts an RGB tuple to a hex color string."""
    return "{:02x}{:02x}{:02x}".format(
        int(rgb_tuple[0]), int(rgb_tuple[1]), int(rgb_tuple[2])
    )


def increase_brightness(hex: str, n_points: int) -> str:
    """
    Increases the brightness of a given hex color string by N points.
    """
    rgb = hex_to_rgb(hex)

    # Increase each RGB component by n_points, capping at 255 and flooring at 0
    new_r = rgb[0] + n_points
    new_g = rgb[1] + n_points
    new_b = rgb[2] + n_points

    return rgb_to_hex((new_r, new_g, new_b))


def generate_color_palette(hex1: str, hex2: str, n: int = 10) -> list[str]:
    """
    Generates a color palette containing N colors interpolated between two input hex color strings.
    """

    if n < 0:
        raise ValueError("N must be a non-negative integer.")
    if n == 0:
        return []
    if n == 1:
        return [hex1]

    # Convert hex colors to RGB
    rgb1 = hex_to_rgb(hex1)
    rgb2 = hex_to_rgb(hex2)

    palette = []
    for i in range(n):
        # Calculate the interpolation factor
        # If n > 1, factor goes from 0.0 to 1.0
        # If n = 1, this path is skipped
        factor = i / (n - 1)

        # Interpolate each RGB component
        r = rgb1[0] + factor * (rgb2[0] - rgb1[0])
        g = rgb1[1] + factor * (rgb2[1] - rgb1[1])
        b = rgb1[2] + factor * (rgb2[2] - rgb1[2])

        # Convert the interpolated RGB back to hex and add to palette
        palette.append(rgb_to_hex((r, g, b)))

    return palette


def load_base3(name, base_folder="base3"):
    filepath = os.path.join(base_folder, f"{name}.yaml")
    try:
        with open(filepath, "r") as f:
            data = yaml.safe_load(f)
    except FileNotFoundError:
        print(f"Error: File '{filepath}' not found.")
        return
    except yaml.YAMLError as e:
        print(f"Error: Could not parse file '{filepath}': {e}")
        return
    return data


def generate_theme(
    name,
    base_folder="base3",
    bright_hue=5,
    main_hues=[10, 20],
    secondary_hues=[10],
    black_hues=[10, 20, 30, 40, 50],
    white_hues=[99, 90, 80, 70, 60],
):
    base3 = load_base3(name, base_folder=base_folder)
    base_colors = generate_color_palette(
        base3["background"], base3["foreground"], n=100
    )
    main_dark_colors = generate_color_palette(base3["main"], base3["background"], n=100)

    secondary_dark_colors = generate_color_palette(
        base3["secondary"], base3["background"], n=100
    )

    main2 = main_dark_colors[main_hues[0]]
    main3 = main_dark_colors[main_hues[1]]
    secondary2 = secondary_dark_colors[secondary_hues[0]]

    # Create a dictionary to hold the generated colors
    generated_colors = {
        "background": base3["background"],
        "foreground": base3["foreground"],
        "main": base3["main"],
        "main_bright": increase_brightness(base3["main"], n_points=bright_hue),
        "main2": main2,
        "main2_bright": increase_brightness(main2, n_points=bright_hue),
        "main3": main3,
        "main3_bright": increase_brightness(main3, n_points=bright_hue),
        "secondary": base3["secondary"],
        "secondary_bright": increase_brightness(
            base3["secondary"], n_points=bright_hue
        ),
        "secondary2": base3["secondary"],
        "secondary2_bright": increase_brightness(secondary2, n_points=bright_hue),
        "accent": base3["accent"],
        "accent_bright": increase_brightness(base3["accent"], n_points=bright_hue),
        "black": base_colors[black_hues[0]],
        "black2": base_colors[black_hues[1]],
        "black3": base_colors[black_hues[2]],
        "black4": base_colors[black_hues[3]],
        "black5": base_colors[black_hues[4]],
        "white": base_colors[white_hues[0]],
        "white2": base_colors[white_hues[1]],
        "white3": base_colors[white_hues[2]],
        "white4": base_colors[white_hues[3]],
        "white5": base_colors[white_hues[4]],
    }
    return generated_colors


def render_jinja2_template(template_file, name, output_file=None):
    """
    Reads a Jinja2 template file and a YAML config file, renders the template
    with the config variables, and optionally writes the output to a file.
    """
    config_data = generate_theme(name)

    # Use the directory of the script as the base path for the file system loader.
    script_dir = os.path.dirname(os.path.abspath(__file__))
    env = Environment(loader=FileSystemLoader(script_dir))

    try:
        template = env.get_template(template_file)
        rendered_output = template.render(config_data)

        if output_file:
            # Ensure the output directory exists
            output_dir = os.path.dirname(output_file)
            if output_dir and not os.path.exists(output_dir):
                os.makedirs(output_dir)
            try:
                with open(output_file, "w") as f:
                    f.write(rendered_output)
                print(f"Successfully rendered template to '{output_file}'.")
            except IOError:
                print(f"Error: Could not write to output file '{output_file}'.")
        else:
            print(rendered_output)

    except FileNotFoundError:
        print(f"Error: Template file '{template_file}' not found.")
    except Exception as e:
        print(f"Error during template rendering: {e}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Render a Jinja2 template with YAML config."
    )
    parser.add_argument(
        "-n", "--name", type=str, help="Colorscheme name", required=True
    )
    args = parser.parse_args()
    name = args.name
    for system, filetype in [("alacritty", "toml"), ("borders", "rc")]:
        template_file = f"templates/{system}_base3.j2"  #  Jinja2 template file.
        output_file = f"{system}/{name}.{filetype}"
        render_jinja2_template(template_file, name, output_file)
