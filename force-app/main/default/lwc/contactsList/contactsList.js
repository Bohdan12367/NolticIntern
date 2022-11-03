/**
 * Created by lukas on 21.08.2022.
 */

import {LightningElement,wire,api} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getContactByAccountId from '@salesforce/apex/ContactController.getContactByAccountId';
import addContact from '@salesforce/apex/ContactController.addContact';


export default class contactsList extends LightningElement {
    @api recordId;
    showForm = false;

    @wire(getContactByAccountId,{accountId:'$recordId'})
    contacts;

    addContact(){
        this.showForm = !this.showForm;
    }
    createContact(){
        addContact({accountId: this.recordId, lastName: this.lastName})
            .then(result => refreshApex(this.contacts))
            .catch(error => console.log(error))
    }
    handleLastNameChange(event){
        this.lastName = event.target.value;
    }

}