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

// Medidas recomendadas sin discos "extra":    
//  grosorDiscos = 4;
//  radioCilindros = 6;
//  anchoBase = 50;
//  grosorBase = 4;

grosorDiscos = 3;
radioCilindros = 3;
anchoBase = 50;
grosorBase = 4;

numDiscosExtra = 4;
difTamDiscos = 3;
separaDiscos = 4;

margenDiscoBase = grosorBase * 2;

if(anchoBase < 5 || anchoBase * 3 > 200) {
    text("Error tamaño base");
}
else {
    if(grosorBase < 1 || grosorBase > 10 || 
            grosorDiscos < 1 || grosorDiscos > 10) {
        text("Error tamaño grosor");
    }
    else {
        // Base rectangular
        difference() {
            for(i=[0:grosorBase-1]) {
                translate([i+10, i+10, i]) {
                    minkowski() {
                        cube([anchoBase * 3 - i*2 - 10*2, anchoBase-i*2-10*2, 1]);
                        cylinder(r=10, h=0.01, $fn=360);
                    }
                }
            }
            translate([anchoBase*3/2, anchoBase-15, grosorBase-2]) {
                linear_extrude(height = 5) {
                    text(text = "TORRES DE HANOI", font = "Arial:style=Bold", size = 7, halign="center");
                }
            }
            translate([anchoBase*3/2, grosorBase+5, grosorBase-2]) {
                linear_extrude(height = 5) {
                    text(text = "IES Ntra. Sra. de los Remedios", font = "Arial:style=Bold", size = 7, halign="center");
                }
            }
        }
        
        // Cilindros
        translate([anchoBase / 2, anchoBase / 2, grosorBase]) {
            for(i=[0:2]) {
                translate([anchoBase * i, 0, 0]) {
                    cylinder((4+numDiscosExtra) * (grosorDiscos + 2), radioCilindros, radioCilindros, $fn=100);
                }
            }
        }

        // 4 primeros discos (obligatorios)        
        radioDiscoMax = (anchoBase - margenDiscoBase) / 2;
        for(i=[0:3]) {
            radioDisco = (anchoBase - margenDiscoBase - i*difTamDiscos) / 2;   
            posX = radioDiscoMax + (radioDiscoMax * 2 * i) * (1 - i * 0.01 * difTamDiscos) + separaDiscos * i;
            //posX = radioDiscoMax + (radioDiscoMax * 2 * i);
            posY = anchoBase + 5 + radioDiscoMax;
            translate([posX, posY, 0]) {
                difference() {
                    cylinder(grosorDiscos, radioDisco, radioDisco, $fn=100);
                    cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
                }
            }
        }
        
        // Discos "extra"
        radioDiscoMaxExtra = (anchoBase - margenDiscoBase - 4*difTamDiscos) / 2;
        if(numDiscosExtra > 0) {
            for(i=[0:numDiscosExtra-1]) {
                radioDisco = (anchoBase - margenDiscoBase - (i+4)*difTamDiscos) / 2;   
                posX = radioDiscoMaxExtra + (radioDiscoMaxExtra * 2 * i) * (1 - i * 0.01 * difTamDiscos) + separaDiscos * i;
                //posX = radioDiscoMax + (radioDiscoMax * 2 * i);
                posY = anchoBase + 5 + radioDiscoMax * 3;
                translate([posX, posY, 0]) {
                    difference() {
                        cylinder(grosorDiscos, radioDisco, radioDisco, $fn=100);
                        cylinder(grosorDiscos, radioCilindros + 1, radioCilindros + 1, $fn=100);
                    }
                }
            }
        }
        
    }
}