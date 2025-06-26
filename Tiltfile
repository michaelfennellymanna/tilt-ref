# Note: This Tiltfile does not interact with any resources. It essentially creates
	a manifest internally based on the information in the Tiltfile and relays
	this to the Tilt engine - the entity that interacts with your tilt resources.


# Specify a build target.
#
# This is a resource that Tilt will manage.
# A resource can be anything, container, k8s resource, script - Tilt is not restricted to k8s objects.
# Lifecycle of this container, from image to running workload is managed by Tilt

docker_build('app1', 'app1')
