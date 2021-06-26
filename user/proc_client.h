#ifndef _PROC_CLIENT_H_
#define _PROC_CLIENT_H_

void cl_ping(struct vka_object *ep);
void cl_new_ep(struct vka_object *ps_ep, struct vka_object *ep);
void cl_proc_watch();
void cl_proc_unwatch();
void cl_new_proc();

#endif
