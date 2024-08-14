import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

export default class extends Controller {
    connect() {
        const excluirPdfLinks = document.querySelectorAll('.delete-pdf-btn');
        excluirPdfLinks.forEach(link => {
            link.addEventListener('click', (event) => {
                event.preventDefault();
                
                const userId = link.dataset.userId;
                const relatorioType = link.dataset.relatorioType;
                
                console.log("Clique no link de exclusão. ID do usuário:", userId);
                console.log("Tipo de relatório:", relatorioType);
                
                this.showAlert(userId, relatorioType);
            });
        });
    
        const liberarBtns = document.querySelectorAll('.liberar-btn');
        liberarBtns.forEach(btn => {
            btn.addEventListener('click', (event) => {
                event.preventDefault();
                
                const userId = btn.dataset.userId;
                
                console.log("Clique no botão de liberar. ID do usuário:", userId);
                
                this.showLiberarAlert(userId);
            });
        });
    
        const refazerBtns = document.querySelectorAll('.refazer-btn'); 
        refazerBtns.forEach(btn => { 
            btn.addEventListener('click', (event) => {
                event.preventDefault();
                
                const userId = btn.dataset.userId;
                
                console.log("Clique no botão de novo preenchimento. ID do usuário:", userId);
                
                this.showRefazerAlert(userId);
            });
        });
    }
    

    showAlert = (userId, relatorioType) => {
        console.log(`Exclusão solicitada: userId=${userId}, relatorioType=${relatorioType}`);
        Swal.fire({
            title: "Você tem certeza? O Termo do aluno será excluído!",
            showCancelButton: true,
            confirmButtonText: "Excluir",
            cancelButtonText: "Cancelar",
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-alert'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const deleteUrl = this.generateDeleteUrl(userId, relatorioType);
                console.log("Redirecionando para:", deleteUrl);
                window.location.href = deleteUrl;
            }
        }).catch(error => console.error("Erro ao exibir alerta:", error));
    }

    showLiberarAlert = (userId) => {
        Swal.fire({
            title: "Você tem certeza que deseja liberar este usuário?",
            text: "Esta ação não pode ser desfeita!",
            showCancelButton: true,
            confirmButtonText: "Liberar",
            cancelButtonText: "Cancelar",
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-alert'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                console.log("Liberando usuário com ID:", userId);
                
                fetch(`/users/${userId}/liberar`)
                    .then(response => {
                        if (response.ok) {
                            console.log("Usuário liberado com sucesso!");
                            
                            Swal.fire("Sucesso!", "Usuário liberado com sucesso!", "success");
                            setTimeout(() => {
                                window.location.reload();
                            }, 1000);
                        } else {
                            console.error("Erro ao liberar usuário:", response.statusText);
                            
                            Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                        }
                    })
                    .catch(error => {
                        console.error("Erro ao liberar usuário:", error);
                       
                        Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                    });
            }
        }).catch(error => console.error(error));
    }

    showRefazerAlert = (userId) => {
        Swal.fire({
            title: "Você tem certeza que deseja liberar este usuário?",
            text: "Esta ação não pode ser desfeita!",
            showCancelButton: true,
            confirmButtonText: "Liberar",
            cancelButtonText: "Cancelar",
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-alert'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                console.log("Liberando usuário com ID:", userId);
                
                fetch(`/users/${userId}/refazer`)
                    .then(response => {
                        if (response.ok) {
                            console.log("Usuário liberado com sucesso!");
                            
                            Swal.fire("Sucesso!", "Usuário liberado com sucesso!", "success");
                            setTimeout(() => {
                                window.location.reload();
                            }, 1000);
                        } else {
                            console.error("Erro ao liberar usuário:", response.statusText);
                            
                            Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                        }
                    })
                    .catch(error => {
                        console.error("Erro ao liberar usuário:", error);
                        
                        Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                    });
            }
        }).catch(error => console.error(error)); 
    }
    
    generateDeleteUrl = (userId, relatorioType) => {
        let deleteUrl = '';
    
        switch (relatorioType) {
            case 'centro':
                deleteUrl = `/delete_relat_centro/${userId}`;
                break;
            case 'campi':
                deleteUrl = `/delete_relat_campi/${userId}`;
                break;
            case 'publico':
                deleteUrl = `/delete_relat_publico/${userId}`;
                break;
            case 'particular':
                deleteUrl = `/delete_relat_particular/${userId}`;
                break;
            case 'naoformal':
                deleteUrl = `/delete_relat_naoformal/${userId}`;
                break;
            case 'aditivocentro':
                deleteUrl = `/delete_relat_aditivocentro/${userId}`;
                break;
            case 'campiaditivo':
                deleteUrl = `/delete_relat_campiaditivo/${userId}`;
                break;
            case 'estadualaditivo':
                deleteUrl = `/delete_relat_estadualaditivo/${userId}`;
                break;
            case 'municipalouparticularaditivo':
                deleteUrl = `/delete_relat_municipalouparticularaditivo/${userId}`;
                break;
            case 'cartaapresentacao':
                deleteUrl = `/delete_carta_apresentacao/${userId}`;
                break;                
            default:
                console.error("Tipo de relatório não reconhecido:", relatorioType);
                break;
        }
    
        return deleteUrl;
    }    
}
