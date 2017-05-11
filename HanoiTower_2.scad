/*
Torres de Hanoi

Diseño 3D de los elementos del juego de las torres de Hanoi.
Desarrollado como ejemplo de programación básica con empleo de
llamadas a funciones, uso de valores literales, operadores y 
variables, para el módulo profesional de Programación
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

//grosorDiscos = 4;
//radioCilindros = 6;
//anchoBase = 50;

grosorDiscos = 2;
radioCilindros = 2;
anchoBase = 30;
grosorBase = 2;

// Base rectangular
cube([anchoBase * 3, anchoBase, grosorBase]);
// Cilindro izquierdo
translate([anchoBase / 2, anchoBase / 2, grosorBase]) {
    cylinder(4 * (grosorDiscos + 2), radioCilindros, radioCilindros, $fn=100);
}
//Cilindro central
translate([anchoBase + anchoBase / 2, anchoBase / 2, grosorBase]) {
    cylinder(4 * (grosorDiscos + 2), radioCilindros, radioCilindros, $fn=100);
}
//Cilindro derecho
translate([2 * anchoBase + anchoBase / 2, anchoBase / 2, grosorBase]) {
    cylinder(4 * (grosorDiscos + 2), radioCilindros, radioCilindros, $fn=100);
}    

radioDisco1 = (anchoBase - 5) / 2;
radioDisco2 = (anchoBase - 10) / 2;
radioDisco3 = (anchoBase - 15) / 2;
radioDisco4 = (anchoBase - 20) / 2;

// Disco 1 (mayor)
translate([radioDisco1, anchoBase + radioDisco1 + 10, 0]) {
    difference() {
        cylinder(grosorDiscos, radioDisco1, radioDisco1, $fn=100);
        cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
    }
    // Disco 2
    translate([radioDisco1 + radioDisco2 + 5, 0, 0]) {
        difference() {
            cylinder(grosorDiscos, radioDisco2, radioDisco2, $fn=100);
            cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
        }
        // Disco 3
        translate([radioDisco2 + radioDisco3 + 5, 0, 0]) {
            difference() {
                cylinder(grosorDiscos, radioDisco3, radioDisco3, $fn=100);
                cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
            }
            // Disco 4 (menor)
            translate([radioDisco3 + radioDisco4 + 5, 0, 0]) {
                difference() {
                    cylinder(grosorDiscos, radioDisco4, radioDisco4, $fn=100);
                    cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
                }
            }
        }
    }
}