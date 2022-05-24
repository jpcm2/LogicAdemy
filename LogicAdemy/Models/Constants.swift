//
//  Constants.swift
//  LogicAdemy
//
//  Created by jpcm2 on 10/05/22.
//

import Foundation
import UIKit

var red = UIColor(red: 214.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)
var redCG = CGColor(red: 214.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1.0)
var primaryColor = UIColor(red: 0.0/255.0, green: 48.0/255.0, blue: 73.0/255.0, alpha: 1.0)
var darkBlue = UIColor(red: 0.0/255.0, green: 48.0/255.0, blue: 73.0/255.0, alpha: 1.0)
var primaryColorCG = CGColor(red: 0.0/255.0, green: 48.0/255.0, blue: 73.0/255.0, alpha: 1.0)
var secondaryColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
var secondaryColorCG = CGColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
var white = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
var whiteCG = CGColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
var background = white
var titleSize: CGFloat = 24
var textSize: CGFloat = 16
var numberOfDays: Int = 0
var darkBg = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
var normalBg = white
var darkModeAuxiliar = false

let cards: [HomePageCard] = [
HomePageCard(title: "Entrada e Saída de dados", description: "Entenda de forma rápida a lógica por trás da entrada e saída de dados na programação", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Estruturas Condicionais - I", description: "Entenda, de uma vez por todas, como funciona a estrutura If / Else na programação.", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Estruturas Condicionais - II", description: "Entenda, de uma vez por todas, como funciona a estrutura Switch case na programação.", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Estruturas de Repetição - I", description: "Entenda, de uma vez por todas, como funciona a estrutura while na programação.", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Estruturas de Repetição - II", description: "Entenda, de uma vez por todas, como funciona a estrutura For loop na programação.", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Estruturas de Repetição - III", description: "Entenda, de uma vez por todas, como funciona a estrutura Do-While na programação.", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Funções", description: "Entenda de forma rápida a lógica por trás como funcionam as funções na programação", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Vetores", description: "Entenda de forma rápida a lógica por trás da estrutura de Vetores na programação", bgColor: secondaryColor, fontColor: primaryColor),
HomePageCard(title: "Matrizes", description: "Entenda de forma rápida a lógica por trás da estrutura de Vetores na programação", bgColor: secondaryColor, fontColor: primaryColor)
]

let settingsCards: [HelpPageCard] = [
HelpPageCard(title: "Qual o objetivo deste aplicativo?", description: "O objetivo deste aplicativo é possibilitar conteúdos sobre lógica de programação.", bgColor: secondaryColor, fontColor: primaryColor),
HelpPageCard(title: "O que é lógica de programação?", description: "Lógica de programação é a técnica de encadear pensamentos para cumprir uma determinada tarefa com uma sequência de instruções.", bgColor: secondaryColor, fontColor: primaryColor),
HelpPageCard(title: "O aplicativo ensina a programar?", description: "Não. Você entederá a lógica que irá facilitar bastante a sua jornada como desenvolvedor.", bgColor: secondaryColor, fontColor: primaryColor),
HelpPageCard(title: "Qual linguagem de programação será ensinado?", description: "O objetivo do aplicativo não é ensinar uma linguagem de programação, mas sim a lógica por trás do desenvolvimento.", bgColor: secondaryColor, fontColor: primaryColor),
HelpPageCard(title: "Apenas o aplicativo é suficiente?", description: "O objetivo do aplicativo é trazer blocos de estudo rápido e resumido. O recomendado é buscar exercícios fora do aplicativo.", bgColor: secondaryColor, fontColor: primaryColor),
HelpPageCard(title: "Qual o objetivo deste aplicativo?", description: "O objetivo deste aplicativo é possibilitar conteúdos sobre lógica de programação.", bgColor: secondaryColor, fontColor: primaryColor)
]
