import setuptools

import vtkmodules.vtkCommonCore as vtk

__version__ = vtk.VTK_VERSION

setuptools.setup(
    name="vtk",
    version=__version__,
    description="Safety wrapper for ParaView's VTK",
    packages=setuptools.find_packages(),
)
