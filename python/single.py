from matplotlib.pylab import plot, show, xlabel, ylabel, xlim, ylim, title, fill_betweenx, legend
from poreplot import poreplot
import sys
import matplotlib.pyplot

def save_figure(name):
    # change these if wanted
    do_save = True
    fig_dir = './'
    if do_save:
        matplotlib.pyplot.savefig(fig_dir + name, bbox_inches='tight')

name = sys.argv[1]
# name = "noxylose10ns.txt"
poreplot(name)

xlabel("Pore Radius (Å)",fontsize=18)
ylabel("Distance along transport path (Å)",fontsize=18)
xlim(0.5,4.0)
# title("SMD 10ns",fontsize=24)
title(name,fontsize=24)
save_figure("tmp.png")