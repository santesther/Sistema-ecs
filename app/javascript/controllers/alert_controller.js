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
    }

    showAlert(userId, relatorioType) {
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
                const deleteUrl = `/delete_relat_${relatorioType}?id=${userId}`;
                console.log("Redirecionando para:", deleteUrl);
                window.location.href = deleteUrl;
            }
        }).catch(error => console.error(error)); // Tratar erros, se houver
    }
    
    generateDeleteUrl(userId, relatorioType) {
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
