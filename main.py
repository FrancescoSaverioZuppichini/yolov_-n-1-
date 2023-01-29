import argparse

from cookiecutter.main import cookiecutter


def main(project_name: str, yolo_version: str):
    cookiecutter(
        "cookiecutter-template/",
        no_input=True,
        overwrite_if_exists=True,
        output_dir="./cookiecutter-output/",
        extra_context={"project_name": project_name, "yolo_version": yolo_version},
    )


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="CLI for managing a YOLO project")
    parser.add_argument("project_name", type=str, help="Name of the project")
    parser.add_argument("yolo_version", type=str, help="Version of YOLO to use")
    args = parser.parse_args()
    main(args.project_name, args.yolo_version)
