#┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
#│     ____  ____  _                                                                                                   │
#│    / __ \/ __ \(_)___  ____  ___  _____                                                                             │
#│   / / / / /_/ / / __ \/ __ \/ _ \/ ___/                                                                             │
#│  / /_/ / _, _/ / /_/ / /_/ /  __/ /                                                                                 │
#│ /_____/_/ |_/_/ .___/ .___/\___/_/                                                                                  │
#│              /_/   /_/                                                                                              │
#│ by @palahsu                                                                                                         │
#└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
#┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
#│ Script by mlnplus                                                                                                   │
#└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
#┌─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
#│ You can rerun the script anytime by running the command dripper.                                                    │
#└─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘

from rich.console import Console
from rich.panel import Panel
from rich.prompt import Prompt
from pyfiglet import Figlet
import subprocess

console = Console()

def main():
    f = Figlet(font='slant')
    ascii_title = f.renderText("DRipper")

    console.print(Panel(ascii_title + "by @palahsu", style="bold magenta", border_style="bright_cyan"))

    console.print(Panel("Script by mlnplus" , style="bold magenta", border_style="bright_cyan"))

    console.print(Panel("You can rerun the script anytime by running the command dripper." , style="bold magenta", border_style="bright_cyan"))
    
    console.print()

    ip_address = ""
    while not ip_address.strip():
        ip_address = Prompt.ask("[bold green]Enter the target IP address[/bold green]").strip()
        if not ip_address:
            console.print("[red]IP address cannot be empty. Please enter a valid IP.[/red]")

    port = Prompt.ask("[bold yellow]Enter the target port (optional, default 80)[/bold yellow]", default="80")

    turbo = Prompt.ask("[bold red]Select turbo port [135 or 443] (default 135)[/bold red]", default="135")
    if turbo not in ("135", "443"):
        turbo = "135"

    cmd = ["python", "DRipper.py", "-s", ip_address, "-p", port, "-t", turbo]
    console.print(Panel(
        f"[bold blue]Executing command:[/bold blue]\n[italic]{' '.join(cmd)}[/italic]",
        border_style="green",
    ))

    subprocess.run(cmd)

if __name__ == "__main__":
    main()
