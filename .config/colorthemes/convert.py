import argparse
import yaml
from jinja2 import Environment, FileSystemLoader
import os


def render_jinja2_template(template_file, config_file, output_file=None):
    """
    Reads a Jinja2 template file and a YAML config file, renders the template
    with the config variables, and optionally writes the output to a file.

    Args:
        template_file (str): Path to the Jinja2 template file.
        config_file (str): Path to the YAML config file.
        output_file (str, optional): Path to the output file. If None,
                                      the rendered template is printed to stdout.
    """
    try:
        with open(config_file, "r") as f:
            config_data = yaml.safe_load(f)
    except FileNotFoundError:
        print(f"Error: Config file '{config_file}' not found.")
        return
    except yaml.YAMLError as e:
        print(f"Error: Could not parse config file '{config_file}': {e}")
        return

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
    template_file = "templates/alacritty.toml.j2"  #  Jinja2 template file.
    config_file = f"base16/{name}.yaml"
    output_file = f"alacritty/{name}.toml"

    render_jinja2_template(template_file, config_file, output_file)

