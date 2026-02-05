# SemiAnalysis Style Guide

Official SA chart styling: **Gold on Dark Navy**.

## Color Palette

```python
SA_COLORS = {
    # Primary
    'gold': '#F5A623',          # SA Gold - PRIMARY accent
    'gold_light': '#FFD93D',    # Lighter gold for fills/highlights
    'gold_dark': '#C78400',     # Darker gold for borders

    # Secondary
    'cyan': '#00D9FF',          # Cyan - good contrast with gold
    'coral': '#FF6B6B',         # Warm coral - alerts, negatives
    'teal': '#4ECDC4',          # Teal - positive indicators
    'purple': '#A78BFA',        # Soft purple - optional accent

    # Neutrals
    'white': '#FFFFFF',
    'gray': '#8B8B9A',          # Secondary text
    'gray_light': '#b0b0b0',    # Axes
    'gray_dark': '#4a4a5a',     # Borders

    # Backgrounds
    'bg': '#1a1a2e',            # Deep navy-black
    'bg_light': '#2a2a3e',      # Cards/boxes
    'bg_lighter': '#3a3a4e',    # Hover states
}

# Series colors (in order of use)
SA_SERIES = ['#F5A623', '#00D9FF', '#FF6B6B', '#4ECDC4', '#A78BFA']
```

## Apply Full Style

```python
import matplotlib.pyplot as plt

def apply_sa_style():
    """Apply SemiAnalysis dark theme."""
    plt.style.use('dark_background')

    SA = {
        'gold': '#F5A623', 'bg': '#1a1a2e', 'bg_light': '#2a2a3e',
        'white': '#FFFFFF', 'gray': '#8B8B9A', 'gray_light': '#b0b0b0',
        'gray_dark': '#4a4a5a'
    }

    plt.rcParams.update({
        # Figure
        'figure.facecolor': SA['bg'],
        'figure.dpi': 150,

        # Axes
        'axes.facecolor': SA['bg'],
        'axes.edgecolor': SA['gray_dark'],
        'axes.labelcolor': SA['white'],
        'axes.titlecolor': SA['white'],
        'axes.titlesize': 13,
        'axes.titleweight': 'bold',
        'axes.labelsize': 10,
        'axes.grid': True,

        # Text
        'text.color': SA['white'],
        'font.family': 'sans-serif',
        'font.size': 10,

        # Ticks
        'xtick.color': SA['gray_light'],
        'ytick.color': SA['gray_light'],
        'xtick.labelsize': 9,
        'ytick.labelsize': 9,

        # Grid
        'grid.color': SA['bg_light'],
        'grid.alpha': 0.5,
        'grid.linewidth': 0.5,

        # Legend
        'legend.facecolor': SA['bg_light'],
        'legend.edgecolor': SA['gray_dark'],
        'legend.labelcolor': SA['white'],
        'legend.fontsize': 9,

        # Save
        'savefig.facecolor': SA['bg'],
        'savefig.dpi': 150,
        'savefig.bbox': 'tight',
    })
```

## Minimal Application (No rcParams)

```python
def apply_sa_minimal(fig, ax):
    """Quick SA styling for existing figure."""
    BG = '#1a1a2e'
    GOLD = '#F5A623'
    GRAY = '#4a4a5a'

    fig.set_facecolor(BG)
    ax.set_facecolor(BG)

    # Spines
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_color(GRAY)
    ax.spines['bottom'].set_color(GRAY)

    # Grid
    ax.yaxis.grid(True, color='#2a2a3e', linewidth=0.5, alpha=0.5)
    ax.set_axisbelow(True)

    # Ticks
    ax.tick_params(colors='#b0b0b0')

    return fig, ax
```

## Typography

```python
plt.rcParams.update({
    'font.family': 'sans-serif',
    'font.sans-serif': ['Inter', 'SF Pro Display', 'Helvetica Neue', 'Arial'],
    'font.size': 10,
    'axes.titlesize': 13,
    'axes.titleweight': 'bold',
})
```

## Number Formatting

```python
from matplotlib.ticker import FuncFormatter

# Percentage
ax.yaxis.set_major_formatter(FuncFormatter(lambda x, _: f'{x:+.0f}%'))

# Currency
def money_fmt(x, _):
    if abs(x) >= 1e9: return f'${x/1e9:.1f}B'
    if abs(x) >= 1e6: return f'${x/1e6:.0f}M'
    return f'${x/1e3:.0f}K'
ax.yaxis.set_major_formatter(FuncFormatter(money_fmt))
```

## Direct Labeling (Preferred over Legends)

```python
# End-of-line label
ax.annotate(f'+{value:.0f}%',
            xy=(dates[-1], values[-1]),
            xytext=(8, 0), textcoords='offset points',
            fontsize=10, fontweight='bold', color='#F5A623',
            va='center')
```

## Reference Implementation

See: `~/cortex/shared/scripts/sa_chart_style.py`
