/*
Torres de Hanoi

Diseño 3D de los elementos del juego de las torres de Hanoi.
Desarrollado como ejemplo de programación básica con empleo de
llamadas a funciones, para el módulo profesional de Programación
del ciclo formativo de Desarrollo de Aplicaciones Web del
IES Ntra. Sra. de los Remedios.

Copyright (C) <2016>  
<Javier García Escobedo (javiergarciaescobedo.es)>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

*/

// Base rectangular
cube([150, 50, 4]);
// Cilindro izquierdo
translate([25, 25, 4]) {
    cylinder(20, 6.5, 6.5, $fn=100);
}
//Cilindro central
translate([75, 25, 4]) {
    cylinder(20, 6.5, 6.5, $fn=100);
}
//Cilindro derecho
translate([125, 25, 4]) {
    cylinder(20, 6.5, 6.5, $fn=100);
}    

// Disco 1 (mayor)
translate([0, 90, 0]) {
    difference() {
        cylinder(4, 45/2, 45/2, $fn=100);
        cylinder(4, 7.5, 7.5, $fn=100);
    }
    // Disco 2
    translate([50, 0, 0]) {
        difference() {
            cylinder(4, 40/2, 40/2, $fn=100);
            cylinder(4, 7.5, 7.5, $fn=100);
        }
        // Disco 3
        translate([45, 0, 0]) {
            difference() {
                cylinder(4, 35/2, 35/2, $fn=100);
                cylinder(4, 7.5, 7.5, $fn=100);
            }
            // Disco 4 (menor)
            translate([40, 0, 0]) {
                difference() {
                    cylinder(4, 30/2, 30/2, $fn=100);
                    cylinder(4, 7.5, 7.5, $fn=100);
                }
            }
        }
    }
}