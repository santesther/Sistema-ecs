import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

export default class extends Controller {
    connect() {
        // Adiciona o ouvinte de evento aos links de exclusão de PDF
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

        // Adiciona o ouvinte de evento aos botões de liberar
        const liberarBtns = document.querySelectorAll('.liberar-btn');
        liberarBtns.forEach(btn => {
            btn.addEventListener('click', (event) => {
                event.preventDefault();
                
                const userId = btn.dataset.userId;
                
                console.log("Clique no botão de liberar. ID do usuário:", userId);
                
                // Realiza a liberação
                this.showLiberarAlert(userId);
            });
        });
    }

    showAlert = (userId, relatorioType) => {
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
        }).catch(error => console.error(error)); // Tratar erros, se houver
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
                // Faz uma requisição GET para a rota de liberação
                fetch(`/users/${userId}/liberar`)
                    .then(response => {
                        if (response.ok) {
                            console.log("Usuário liberado com sucesso!");
                            // Aqui você pode adicionar a lógica para tratar o sucesso da liberação
                            Swal.fire("Sucesso!", "Usuário liberado com sucesso!", "success");
                            setTimeout(() => {
                                window.location.reload();
                            }, 1000);
                        } else {
                            console.error("Erro ao liberar usuário:", response.statusText);
                            // Aqui você pode adicionar a lógica para tratar o erro da liberação
                            Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                        }
                    })
                    .catch(error => {
                        console.error("Erro ao liberar usuário:", error);
                        // Aqui você pode adicionar a lógica para tratar o erro da liberação
                        Swal.fire("Erro!", "Ocorreu um erro ao liberar o usuário.", "error");
                    });
            }
        }).catch(error => console.error(error)); // Tratar erros, se houver
    }
    
    generateDeleteUrl = (userId, relatorioType) => {
        let deleteUrl = '';
        
        switch (relatorioType) {
            case 'centro':
                deleteUrl = `/delete_relat_centro?id=${userId}`;
                break;
            case 'campi':
                deleteUrl = `/delete_relat_campi?id=${userId}`;
                break;
            case 'publico':
                deleteUrl = `/delete_relat_publico?id=${userId}`;
                break;
            case 'particular':
                deleteUrl = `/delete_relat_particular?id=${userId}`;
                break;
            case 'naoformal':
                deleteUrl = `/delete_relat_naoformal?id=${userId}`;
                break;
            case 'aditivocentro':
                deleteUrl = `/delete_relat_aditivocentro?id=${userId}`;
                break;
            case 'campiaditivo':
                deleteUrl = `/delete_relat_campiaditivo?id=${userId}`;
                break;
            case 'estadualaditivo':
                deleteUrl = `/delete_relat_estadualaditivo?id=${userId}`;
                break;
            case 'municipalouparticularaditivo':
                deleteUrl = `/delete_relat_municipalouparticularaditivo?id=${userId}`;
                break;
            default:
                console.error("Tipo de relatório não reconhecido:", relatorioType);
        }
        
        return deleteUrl;
    }
}
