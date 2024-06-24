import numpy as np
import sympy as sym
import matplotlib.pyplot as plt

#intialize variables for Sun and Earth
a = 0
b = 3.335e7
years = 3
n = years*52
h = 604800
G = 6.6743*10**(-11)
M = 1.9891*10**(30)
m = 5.9722*10**(24)
el = 2.7*10**(40)
rmin = 147.1*10**(9)
rmax = 152.1*10**(9)
theta = 0
t = np.arange(0,years*365-7,7)

#initialize symbols
u1 = sym.symbols('u1')
u2 = sym.symbols('u2')
# el = sym.symbols('el')
# G = sym.symbols('G')
# M = sym.symbols('M')
# m = sym.symbols('m')
# theta = sym.symbols('theta')
#x = sym.symbols('x')
#y = sym.symbols('y')

# #initialize functions
f = el/(m*u1**2)                            #dtheta/dt
du1 = u2                                    #dr/dt
du2 = (el**2/(m**2*u1**3)) - G*M/(u1**2)


def RungeKutta(n,h,r,rdot,theta,f,du1,du2):
    u = np.array([[r],[rdot]])
    the = np.array([theta])
    x = np.array([r*np.cos(theta)])
    y = np.array([r*np.sin(theta)])
    
    for i in np.arange(0,n-1):
        k11 = h*du1.subs(u2,u[1,i])
        k12 = h*du2.subs(u1,u[0,i])
        k13 = h*f.subs(u1,u[0,i])
        
        k21 = h*du1.subs(u2,u[1,i]+k12/2)
        k22 = h*du2.subs(u1,u[0,i]+k11/2)
        k23 = h*f.subs(u1,u[0,i]+k11/2)
        
        k31 = h*du1.subs(u2,u[1,i]+k22/2)
        k32 = h*du2.subs(u1,u[0,i]+k21/2)
        k33 = h*f.subs(u1,u[0,i]+k21/2)
        
        k41 = h*du1.subs(u2,u[1,i]+k32)
        k42 = h*du2.subs(u1,u[0,i]+k31)
        k43 = h*f.subs(u1,u[0,i]+k31)
        
        w1 = u[0,i]+(1/6)*(k11+2*k21+2*k31+k41)
        w2 = u[1,i]+(1/6)*(k12+2*k22+2*k32+k42)
        
        u = np.hstack((u,np.array([[w1],[w2]])))
        the = np.append(the,the[i]+(1/6)*(k13+2*k23+2*k33+k43))
        x = np.append(x,[sym.cos(the[i+1])*u[0,i+1]])
        y = np.append(y,[sym.sin(the[i+1])*u[0,i+1]])
    
    return(u,the,x,y)

# #find the C.P for u1:
u1CP = sym.solve(du2,u1)
u1CP = float(u1CP[0])

#Initialize interval around C.P.
kstep = 1e10
u1interval1 = np.arange(u1CP-5*kstep,u1CP+6*kstep,kstep)
zerointerval = np.linspace(0,u1CP-5*kstep,np.size(u1interval1))
uinterval = np.vstack((u1interval1,zerointerval))

#Time Course Plot
plt.figure(2,figsize=(6,6))

for i in np.arange(0,2):
    for k in np.arange(0,np.size(u1interval1)):

        rdot = 0
        r = uinterval[i,k]
        thet = 0
        rad,angle,x,y = RungeKutta(n,h,r,rdot,thet,f,du1,du2)
        plt.plot(t,rad[0,:], lw = 1.7)
        
plt.xlabel('t (days)', fontsize = '20')
plt.ylabel('radius (m)', fontsize = '20')
plt.tick_params(labelsize = '20')
plt.ylim(0,4.5e11)
plt.xlim(np.min(t),np.max(t))
    