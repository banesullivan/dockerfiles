# ParaView Base Dockerfile

See https://github.com/banesullivan/dockerfiles/tree/master/paraview

This Dockerfile sets up ParaView in an environment so that it is ready to be
used via Python/Jupyter.

NOTE: Sometimes, you will run into a an error:

```
ERR| vtkXOpenGLRenderWindow (0x555f479c24c0): bad X server connection. DISPLAY=:99.0. Aborting.
```

this is a flakey and known issue. Simply try again and the headless display
should work. This happens at random.

If inheriting this image, make sure to set your entry point to include:

```
# Make sure to borrow entry point from parent image
ENTRYPOINT ["tini", "-g", "--", "start_xvfb.sh"]
```


This also handles the nuances of using ParaView's budled VTK by registering it
with `pip`
