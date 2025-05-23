import argparse
import yaml
from jinja2 import Environment, FileSystemLoader
import os
import colorsys
import webcolors
from PIL import Image, ImageDraw, ImageFont


def display_colors(
    color_dict: dict, image_width: int = 400, color_strip_height: int = 60
):
    """
    Creates a single image displaying all colors from a dictionary as strips,
    along with their names and hex codes.
    """
    if not color_dict:
        print("The color dictionary is empty. No image to create.")
        return

    num_colors = len(color_dict)
    total_image_height = num_colors * color_strip_height

    # Create a new blank RGB image
    img = Image.new("RGB", (image_width, total_image_height), color="white")
    draw = ImageDraw.Draw(img)

    # Try to load a default font for better text rendering
    try:
        # Common font names for various OS. Adjust path if needed.
        font = ImageFont.truetype("arial.ttf", 16)  # Windows
    except IOError:
        try:
            font = ImageFont.truetype("LiberationSans-Regular.ttf", 16)  # Linux
        except IOError:
            try:
                font = ImageFont.truetype("Arial.ttf", 16)  # macOS / another common one
            except IOError:
                font = ImageFont.load_default()  # Fallback to default PIL font

    y_offset = 0
    for color_name, hex_code in color_dict.items():
        clean_hex = hex_code.lstrip("#").strip()
        if len(clean_hex) != 6:
            print(
                f"Warning: Invalid hex code length for '{color_name}': '{hex_code}'. Skipping this color."
            )
            continue

        # Convert hex to RGB tuple
        rgb_color = webcolors.hex_to_rgb(f"#{clean_hex}")

        # Draw the color strip
        draw.rectangle(
            [0, y_offset, image_width, y_offset + color_strip_height],
            fill=rgb_color,
        )

        # Determine text color for readability (black or white)
        # A common luminance formula for perceived brightness
        r, g, b = rgb_color
        luminance = 0.299 * r + 0.587 * g + 0.114 * b
        text_fill_color = (
            (0, 0, 0) if luminance > 186 else (255, 255, 255)
        )  # Black or White

        # Prepare text string
        display_text = f"{color_name}: #{clean_hex}"

        # Get text bounding box to center it vertically
        # Pillow 9.2.0+ uses textbbox, older versions use textsize (deprecated)
        try:
            text_bbox = draw.textbbox((0, 0), display_text, font=font)
            text_width = text_bbox[2] - text_bbox[0]
            text_height = text_bbox[3] - text_bbox[1]
        except AttributeError:  # Fallback for older Pillow versions
            text_width, text_height = draw.textsize(display_text, font=font)

        # Center text horizontally and vertically within the strip
        text_x = (image_width - text_width) // 2
        text_y = y_offset + (color_strip_height - text_height) // 2

        # Draw the text on the color strip
        draw.text((text_x, text_y), display_text, fill=text_fill_color, font=font)

        y_offset += color_strip_height

    # Display the final image
    img.show(title="Color Palette")


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
    r_norm, g_norm, b_norm = rgb[0] / 255.0, rgb[1] / 255.0, rgb[2] / 255.0
    h, l, s = colorsys.rgb_to_hls(r_norm, g_norm, b_norm)
    new_l = max(0.0, min(1.0, l * (1 + n_points / 100.0)))
    new_r_norm, new_g_norm, new_b_norm = colorsys.hls_to_rgb(h, new_l, s)

    # Increase each RGB component by n_points, capping at 255 and flooring at 0
    new_r = max(0, min(255, new_r_norm * 255))
    new_g = max(0, min(255, new_g_norm * 255))
    new_b = max(0, min(255, new_b_norm * 255))
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
):
    base3 = load_base3(name, base_folder=base_folder)
    bright_hue = base3["bright_hue"]
    main_hues = base3.get("main_hues")
    secondary_hues = base3.get("secondary_hues")
    comment_hue = base3.get("comment_hue")
    black_hues = base3["black_hues"]
    base_colors = generate_color_palette(
        base3["background"], base3["foreground"], n=100
    )
    main_colors = generate_color_palette(base3["main"], base3["background"], n=100)

    secondary_colors = generate_color_palette(
        base3["secondary"], base3["background"], n=100
    )

    if "main2" in base3:
        main2 = base3["main2"]
    else:
        main2 = main_colors[main_hues[0]]
    if "main3" in base3:
        main3 = base3["main3"]
    else:
        main3 = main_colors[main_hues[1]]
    if "secondary2" in base3:
        secondary2 = base3["secondary2"]
    else:
        secondary2 = secondary_colors[secondary_hues[0]]

    # Create a dictionary to hold the generated colors
    generated_colors = {
        "background": base3["background"],
        "foreground": base3["foreground"],
        "main": base3["main"],
        "main2": main2,
        "main3": main3,
        "secondary": base3["secondary"],
        "secondary2": secondary2,
        "accent": base3["accent"],
        "main_bright": increase_brightness(base3["main"], n_points=bright_hue),
        "main2_bright": increase_brightness(main2, n_points=bright_hue),
        "main3_bright": increase_brightness(main3, n_points=bright_hue),
        "secondary_bright": increase_brightness(
            base3["secondary"], n_points=bright_hue
        ),
        "secondary2_bright": increase_brightness(secondary2, n_points=bright_hue),
        "accent_bright": increase_brightness(base3["accent"], n_points=bright_hue),
        "black_comment": base_colors[comment_hue],
        "black": base_colors[black_hues[0]],
        "black2": base_colors[black_hues[1]],
        "black3": base_colors[black_hues[2]],
        "black4": base_colors[black_hues[3]],
        "black5": base_colors[black_hues[4]],
        "black6": base_colors[black_hues[5]],
        "black7": base_colors[black_hues[6]],
        "black8": base_colors[black_hues[7]],
        "white": base3["foreground"],
        "white_bright": increase_brightness(base3["foreground"], n_points=bright_hue),
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

    return config_data


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
        template_file = f"templates/{system}.j2"
        output_file = f"{system}/{name}.{filetype}"
        config_data = render_jinja2_template(template_file, name, output_file)
    display_colors(config_data)
