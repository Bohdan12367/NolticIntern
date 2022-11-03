/**
 * Created by lukas on 17.08.2022.
 */

import {LightningElement} from 'lwc';

export default class ContactList extends LightningElement {
    contacts =[
        {
            Id:1,
            Name:'Bohdan',
            Email:'bohdan@gmail.com',
            Phone:102
        },
        {
            Id:2,
            Name:'Stepan',
            Email:'stepan@gmail.com',
            Phone:103
        },
        {
            Id:3,
            Name:'Ivan',
            Email:'ivan@gmail.com',
            Phone:104
        }

    ]
}